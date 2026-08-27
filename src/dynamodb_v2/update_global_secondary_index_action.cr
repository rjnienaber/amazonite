module Amazonite::DynamoDBV2
  class UpdateGlobalSecondaryIndexAction
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    def initialize(
      @index_name : String,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
    )
    end
  end
end
