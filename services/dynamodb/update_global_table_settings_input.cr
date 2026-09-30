private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class UpdateGlobalTableSettingsInput
    include JSON::Serializable

    # The name of the global table
    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    # The billing mode of the global table. If `GlobalTableBillingMode` is not specified, the global
    # table defaults to `PROVISIONED` capacity billing mode.
    #
    # - `PROVISIONED` - We recommend using `PROVISIONED` for predictable workloads. `PROVISIONED` sets
    # the billing mode to [Provisioned capacity
    # mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html).
    #
    # - `PAY_PER_REQUEST` - We recommend using `PAY_PER_REQUEST` for unpredictable workloads.
    # `PAY_PER_REQUEST` sets the billing mode to [On-demand capacity
    # mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html).
    @[JSON::Field(key: "GlobalTableBillingMode", converter: ADDB::BillingMode)]
    property global_table_billing_mode : BillingMode | Nil

    # The maximum number of writes consumed per second before DynamoDB returns a
    # `ThrottlingException.`
    @[JSON::Field(key: "GlobalTableProvisionedWriteCapacityUnits")]
    property global_table_provisioned_write_capacity_units : Int64 | Nil

    # Auto scaling settings for managing provisioned write capacity for the global table.
    @[JSON::Field(key: "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate")]
    property global_table_provisioned_write_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil

    # Represents the settings of a global secondary index for a global table that will be modified.
    @[JSON::Field(key: "GlobalTableGlobalSecondaryIndexSettingsUpdate")]
    property global_table_global_secondary_index_settings_update : Array(GlobalTableGlobalSecondaryIndexSettingsUpdate) | Nil

    # Represents the settings for a global table in a Region that will be modified.
    @[JSON::Field(key: "ReplicaSettingsUpdate")]
    property replica_settings_update : Array(ReplicaSettingsUpdate) | Nil

    def initialize(
      @global_table_name : String,
      @global_table_billing_mode : BillingMode | Nil = nil,
      @global_table_provisioned_write_capacity_units : Int64 | Nil = nil,
      @global_table_provisioned_write_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil = nil,
      @global_table_global_secondary_index_settings_update : Array(GlobalTableGlobalSecondaryIndexSettingsUpdate) | Nil = nil,
      @replica_settings_update : Array(ReplicaSettingsUpdate) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @global_table_name
        raise Core::ValidationError.new("GlobalTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("GlobalTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("GlobalTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @global_table_provisioned_write_capacity_units
        raise Core::ValidationError.new("GlobalTableProvisionedWriteCapacityUnits value must be >= 1") if value < 1
      end

      if value = @global_table_provisioned_write_capacity_auto_scaling_settings_update
        value.validate!
      end

      if value = @global_table_global_secondary_index_settings_update
        raise Core::ValidationError.new("GlobalTableGlobalSecondaryIndexSettingsUpdate must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("GlobalTableGlobalSecondaryIndexSettingsUpdate must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end

      if value = @replica_settings_update
        raise Core::ValidationError.new("ReplicaSettingsUpdate must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ReplicaSettingsUpdate must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@global_table_name, @global_table_billing_mode, @global_table_provisioned_write_capacity_units, @global_table_provisioned_write_capacity_auto_scaling_settings_update, @global_table_global_secondary_index_settings_update, @replica_settings_update)
  end
end
