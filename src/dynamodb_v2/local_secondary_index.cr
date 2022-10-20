module Amazonite::DynamoDBv2
  class LocalSecondaryIndex
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement)

    @[JSON::Field(key: "Projection")]
    property projection : Projection

    def initialize(
      @index_name : String,
      @key_schema : Array(KeySchemaElement),
      @projection : Projection
    )
    end
  end
end
