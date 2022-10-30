module Amazonite::DynamoDBV2
  class LocalSecondaryIndexDescription
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) | Nil

    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

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
      @index_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @index_arn : String | Nil = nil
    )
    end
  end
end
