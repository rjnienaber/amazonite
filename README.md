# Amazonite AWS SDK
![example workflow](https://github.com/rjnienaber/amazonite/actions/workflows/ci.yml/badge.svg)
[![shard version](https://img.shields.io/github/v/tag/rjnienaber/amazonite?label=version)](https://github.com/rjnienaber/amazonite/tags)
[![license](https://img.shields.io/github/license/rjnienaber/amazonite)](LICENSE)
![crystal](https://img.shields.io/badge/crystal-%3E%3D%201.5.1-black)

Amazonite is an unofficial AWS SDK for Crystal, generated directly from AWS's own API models so
service coverage tracks AWS rather than a hand-maintained subset. It resolves credentials the same
way the official SDKs do (env vars, profiles, SSO, ECS, EC2 instance metadata) and refreshes
temporary credentials automatically, so a `Client.new` behaves the way you'd expect coming from
`boto3` or the AWS SDK for JS/Go/etc.

[API documentation](https://rjnienaber.github.io/amazonite/) is generated with `crystal docs` and published on every push to `master`.

> Amazonite is not affiliated with, endorsed by, or sponsored by Amazon.com, Inc. or its affiliates. "AWS" and "Amazon" are trademarks of Amazon.com, Inc. or its affiliates.

* Typed clients and models generated from AWS's own API definitions, not maintained by hand
* Automatic credential resolution across env vars, profiles, SSO, ECS, and EC2 instance metadata
* Automatic refresh of temporary credentials (AssumeRole, SSO, ECS, EC2) as they near expiry
* 15 AWS services supported today, with integration tests for each - see [Supported APIs](#supported-apis)
* API docs regenerated and published on every push to `master`

## Contents

- [Usage](#usage)
- [Credentials](#credentials)
- [Supported APIs](#supported-apis)
- [Installation](#installation)
- [Development](#development)
- [Contributing](#contributing)
- [Contributors](#contributors)

## Usage

Here's an example that creates a table in DynamoDB:

```crystal
require "amazonite/dynamodb_v2"

private alias DB = Amazonite::DynamoDBV2

model = DB::CreateTableInput.new(
  "Music",
  [
    DB::AttributeDefinition.new("Artist", DB::ScalarAttributeType::S),
    DB::AttributeDefinition.new("SongTitle", DB::ScalarAttributeType::S)
  ],
  [
    DB::KeySchemaElement.new("Artist", DB::KeyType::Hash),
    DB::KeySchemaElement.new("SongTitle", DB::KeyType::Range)
  ],
  provisioned_throughput: DB::ProvisionedThroughput.new(10, 5),
)

client = DB::Client.new # resolves credentials from the default provider chain
response = client.create_table(model)

puts response.http.status_code # 200
result = response.result
puts result.table_description.try &.table_name # Music
puts result.table_description.try &.attribute_definitions.try &.[0].attribute_name # Artist
```

Output:
```
200
Music
Artist
```

## Credentials

Amazonite follows the same credential provider chain as the official AWS SDKs, so you generally don't
need to configure credentials yourself. `Client.new`/`Config.new` accept `access_key_id`/`secret_access_key`/`region`
directly, but if you leave them out, credentials are resolved automatically from the following sources, in order:

1. Environment variables (`AWS_ACCESS_KEY_ID`/`AWS_SECRET_ACCESS_KEY`/`AWS_SESSION_TOKEN`)
2. A static profile in `~/.aws/credentials` (via `AWS_PROFILE` or `Config.new(profile: "...")`)
3. `role_arn`/`source_profile` chaining in `~/.aws/config` (calls STS `AssumeRole`)
4. An SSO cached token from `aws sso login` (calls SSO `GetRoleCredentials`)
5. ECS/Fargate container credentials (`AWS_CONTAINER_CREDENTIALS_RELATIVE_URI`/`_FULL_URI`)
6. EC2 instance metadata (IMDSv2) - set `AWS_EC2_METADATA_DISABLED=true` to skip this check on
   non-EC2 hosts (e.g. local development, CI) so it doesn't add latency to every client

Temporary credentials (from AssumeRole, SSO, ECS, or EC2) are refreshed automatically as they near
expiry.

## Supported APIs

| Name          | Supported?      |Integration Tests  | Notes                                                                 |
| ------------- | :-------------: | :---------------: |-------------                                                          |
| DynamoDB      | ✅              |✅                 |                                                                       |
| SSM           | ✅              |✅                 |                                                                       |
| SQS           | ✅              |✅                 |                                                                       |
| KMS           | ✅              |✅                 |                                                                       |
| Secrets Manager | ✅            |✅                 |                                                                       |
| Lambda        | ✅              |✅                 | InvokeWithResponseStream isn't generated - uses event-stream framing, not a plain request/response |
| SNS           | ✅              |✅                 |                                                                       |
| IAM           | ✅              |✅                 |                                                                       |
| CloudWatch    | ✅              |✅                 |                                                                       |
| STS           | ✅              |✅                 |                                                                       |
| CloudFormation | ✅             |✅                 |                                                                       |
| API Gateway   | ✅              |✅                 |                                                                       |
| EventBridge   | ✅              |✅                 |                                                                       |
| CloudWatch Logs | ✅            |✅                 | GetLogObject and StartLiveTail aren't generated - use event-stream framing, not a plain request/response |
| Kinesis       | ✅              |✅                 | SubscribeToShard isn't generated - uses event-stream framing, not a plain request/response |
| S3            |  🚫             | 🚫                | Consider using [awscr-s3](https://github.com/taylorfinnell/awscr-s3)  |

For example usage, please look at [the integration tests](integration). If you need an API that is not listed here,
please open an issue or pull request with the generated code.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     amazonite:
       github: rjnienaber/amazonite
   ```

2. Run `shards install`

## Development
Once you've cloned the repo, have a look at the `scripts` directory for some scripts that help with development. Some of them use the excellent [watchexec](https://github.com/watchexec/watchexec) tool to watch for changes.

* `./scripts/watch_specs.sh`
  * watches for code changes and runs the specs
* `./scripts/watch_codegen.sh`
  * watches for code changes and regenerates the code for apis
* `./scripts/watch_integration.cr`
  * watches for code changes and executes integration tests

`codegen/codegen.cr` (built as `bin/codegen`, or run directly with `crystal run codegen/codegen.cr --`) accepts flags to point it at a different `api-models-aws` checkout, change the output directory, control log verbosity, and restrict which services/protocols get generated. Run it with `-h` for the full list, e.g.:

```
crystal run codegen/codegen.cr -- --models-dir ../api-models-aws --output-dir tmp --service dynamodb --service ssm --log-level debug
```

## Contributing

1. Fork it (<https://github.com/rjnienaber/amazonite/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Richard Nienaber](https://github.com/rjnienaber) - creator and maintainer
