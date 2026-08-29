module Amazonite::DynamoDBV2
  # Represents the properties of a replica global secondary index.
  class ReplicaGlobalSecondaryIndex
    include JSON::Serializable

    # The name of the global secondary index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    # Replica table GSI-specific provisioned throughput. If not specified, uses the source table GSI's
    # read capacity settings.
    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    # Overrides the maximum on-demand throughput settings for the specified global secondary index in
    # the specified replica table.
    @[JSON::Field(key: "OnDemandThroughputOverride")]
    property on_demand_throughput_override : OnDemandThroughputOverride | Nil

    def initialize(
      @index_name : String,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil,
      @on_demand_throughput_override : OnDemandThroughputOverride | Nil = nil,
    )
    end
  end
end
