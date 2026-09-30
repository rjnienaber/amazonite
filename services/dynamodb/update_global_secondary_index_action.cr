private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @provisioned_throughput
        value.validate!
      end

      if value = @on_demand_throughput
        value.validate!
      end

      if value = @warm_throughput
        value.validate!
      end
    end

    def_equals_and_hash(@index_name, @provisioned_throughput, @on_demand_throughput, @warm_throughput)
  end
end
