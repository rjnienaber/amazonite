module Amazonite::DynamoDBv2
  class CreateGlobalSecondaryIndexAction
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement)

    @[JSON::Field(key: "Projection")]
    property projection : Projection

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    def initialize(
      @index_name : String,
      @key_schema : Array(KeySchemaElement),
      @projection : Projection,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil
    )
    end
  end
end