private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the settings of a global secondary index for a global table that will be modified.
  class ReplicaGlobalSecondaryIndexSettingsUpdate
    include JSON::Serializable

    # The name of the global secondary index. The name must be unique among all other indexes on this
    # table.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
    # `ThrottlingException`.
    @[JSON::Field(key: "ProvisionedReadCapacityUnits")]
    property provisioned_read_capacity_units : Int64 | Nil

    # Auto scaling settings for managing a global secondary index replica's read capacity units.
    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettingsUpdate")]
    property provisioned_read_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @index_name : String,
      @provisioned_read_capacity_units : Int64 | Nil = nil,
      @provisioned_read_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @provisioned_read_capacity_units
        raise Core::ValidationError.new("ProvisionedReadCapacityUnits value must be >= 1") if value < 1
      end

      if value = @provisioned_read_capacity_auto_scaling_settings_update
        value.validate!
      end
    end

    def_equals_and_hash(@index_name, @provisioned_read_capacity_units, @provisioned_read_capacity_auto_scaling_settings_update)
  end
end
