module Amazonite::DynamoDBV2
  # Represents the new provisioned throughput settings to be applied to a global secondary index.
  class UpdateGlobalSecondaryIndexAction
    include JSON::Serializable

    # The name of the global secondary index to be updated.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    # Represents the provisioned throughput settings for the specified global secondary index.
    #
    # For current minimum and maximum provisioned throughput values, see [Service, Account, and Table
    # Quotas](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html) in the
    # *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    # Updates the maximum number of read and write units for the specified global secondary index. If
    # you use this parameter, you must specify `MaxReadRequestUnits`, `MaxWriteRequestUnits`, or both.
    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    # Represents the warm throughput value of the new provisioned throughput settings to be applied to
    # a global secondary index.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : WarmThroughput | Nil

    def initialize(
      @index_name : String,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
      @warm_throughput : WarmThroughput | Nil = nil,
    )
    end

    def_equals_and_hash(@index_name, @provisioned_throughput, @on_demand_throughput, @warm_throughput)
  end
end
