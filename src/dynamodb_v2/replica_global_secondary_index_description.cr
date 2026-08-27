module Amazonite::DynamoDBV2
  class ReplicaGlobalSecondaryIndexDescription
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    @[JSON::Field(key: "OnDemandThroughputOverride")]
    property on_demand_throughput_override : OnDemandThroughputOverride | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil,
      @on_demand_throughput_override : OnDemandThroughputOverride | Nil = nil,
    )
    end
  end
end
