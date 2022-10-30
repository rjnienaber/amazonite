module Amazonite::DynamoDBV2
  class LocalSecondaryIndexInfo
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) | Nil

    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil
    )
    end
  end
end
