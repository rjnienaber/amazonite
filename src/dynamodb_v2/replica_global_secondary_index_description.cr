module Amazonite::DynamoDBV2
  # Represents the properties of a replica global secondary index.
  class ReplicaGlobalSecondaryIndexDescription
    include JSON::Serializable

    # The name of the global secondary index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # If not described, uses the source table GSI's read capacity settings.
    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    # Overrides the maximum on-demand throughput for the specified global secondary index in the
    # specified replica table.
    @[JSON::Field(key: "OnDemandThroughputOverride")]
    property on_demand_throughput_override : OnDemandThroughputOverride | Nil

    # Represents the warm throughput of the global secondary index for this replica.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : GlobalSecondaryIndexWarmThroughputDescription | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil,
      @on_demand_throughput_override : OnDemandThroughputOverride | Nil = nil,
      @warm_throughput : GlobalSecondaryIndexWarmThroughputDescription | Nil = nil,
    )
    end
  end
end
