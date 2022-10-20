private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class GlobalSecondaryIndexDescription
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) | Nil

    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

    @[JSON::Field(key: "IndexStatus", converter: ADDB::IndexStatus)]
    property index_status : IndexStatus | Nil

    @[JSON::Field(key: "Backfilling")]
    property backfilling : Bool | Nil

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughputDescription | Nil

    @[JSON::Field(key: "IndexSizeBytes")]
    property index_size_bytes : Int64 | Nil

    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

    @[JSON::Field(key: "IndexArn")]
    property index_arn : String | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil,
      @index_status : IndexStatus | Nil = nil,
      @backfilling : Bool | Nil = nil,
      @provisioned_throughput : ProvisionedThroughputDescription | Nil = nil,
      @index_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @index_arn : String | Nil = nil
    )
    end
  end
end
