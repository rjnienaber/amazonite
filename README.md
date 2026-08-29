# Amazonite AWS SDK
![example workflow](https://github.com/rjnienaber/amazonite/actions/workflows/ci.yml/badge.svg)

Amazonite is an unofficial AWS SDK for Crystal.

[API documentation](https://rjnienaber.github.io/amazonite/) is generated with `crystal docs` and published on every push to `master`.

> Amazonite is not affiliated with, endorsed by, or sponsored by Amazon.com, Inc. or its affiliates. "AWS" and "Amazon" are trademarks of Amazon.com, Inc. or its affiliates.

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

client = DB::Client.new # read credentials from environment variables
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

## Supported APIs
API types that can be generated:
* `json`
* `rest-json`
* `query`

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

## Contributing

1. Fork it (<https://github.com/rjnienaber/amazonite/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Richard Nienaber](https://github.com/rjnienaber) - creator and maintainer
