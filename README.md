# Amazonite AWS SDK

Amazonite is an unofficial AWS SDK for Crystal. This is still in an alpha stage of development.

## Usage

Here's an example that creates a table in DynamoDB:

```crystal
require "amazonite/dynamodb"

private alias DB = Amazonite::DynamoDB

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

*


## Contributing

1. Fork it (<https://github.com/rjnienaber/amazonite/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Richard Nienaber](https://github.com/rjnienaber) - creator and maintainer
