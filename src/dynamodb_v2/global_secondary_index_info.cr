module Amazonite::DynamoDBV2
  class GlobalSecondaryIndexInfo
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) | Nil

    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil
    )
    end
  end
end
