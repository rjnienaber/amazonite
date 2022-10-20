# Amazonite AWS SDK
![example workflow](https://github.com/rjnienaber/amazonite/actions/workflows/ci.yml/badge.svg)

Amazonite is an unofficial AWS SDK for Crystal.

## Usage

Here's an example that creates a table in DynamoDB:

```crystal
require "amazonite/dynamodb_v2"

private alias DB = Amazonite::DynamoDBv2

model = DB::CreateTableInput.new(
  [
    DB::AttributeDefinition.new("Artist", DB::ScalarAttributeType::S),
    DB::AttributeDefinition.new("SongTitle", DB::ScalarAttributeType::S)
  ],
  "Music",
  [
    DB::KeySchemaElement.new("Artist", DB::KeyType::Hash),
    DB::KeySchemaElement.new("SongTitle", DB::KeyType::Range)
  ],
  provisioned_throughput: DB::ProvisionedThroughput.new(10, 5),
)

client = DB::Client.new
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
| Name          | Supported?      |Integration Tests  | Notes                                                                 |
| ------------- | :-------------: | :---------------: |-------------                                                          |
| DynamoDB      | ✅              |✅                 |                                                                       |
| S3            |  🚫             | 🚫                | Consider using [awscr-s3](https://github.com/taylorfinnell/awscr-s3)  |


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
