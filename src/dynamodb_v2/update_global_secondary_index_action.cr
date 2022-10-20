module Amazonite::DynamoDBv2
  class UpdateGlobalSecondaryIndexAction
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput

    def initialize(
      @index_name : String,
      @provisioned_throughput : ProvisionedThroughput
    )
    end
  end
end
