private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents the properties of a global secondary index.
  class ReplicaGlobalSecondaryIndexSettingsDescription
    include JSON::Serializable

    # The name of the global secondary index. The name must be unique among all other indexes on this
    # table.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    # The current status of the global secondary index:
    #
    # - `CREATING` - The global secondary index is being created.
    #
    # - `UPDATING` - The global secondary index is being updated.
    #
    # - `DELETING` - The global secondary index is being deleted.
    #
    # - `ACTIVE` - The global secondary index is ready for use.
    @[JSON::Field(key: "IndexStatus", converter: ADDB::IndexStatus)]
    property index_status : IndexStatus | Nil

    # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
    # `ThrottlingException`.
    @[JSON::Field(key: "ProvisionedReadCapacityUnits")]
    property provisioned_read_capacity_units : Int64 | Nil

    # Auto scaling settings for a global secondary index replica's read capacity units.
    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettings")]
    property provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    # The maximum number of writes consumed per second before DynamoDB returns a
    # `ThrottlingException`.
    @[JSON::Field(key: "ProvisionedWriteCapacityUnits")]
    property provisioned_write_capacity_units : Int64 | Nil

    # Auto scaling settings for a global secondary index replica's write capacity units.
    @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingSettings")]
    property provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    def initialize(
      @index_name : String,
      @index_status : IndexStatus | Nil = nil,
      @provisioned_read_capacity_units : Int64 | Nil = nil,
      @provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @provisioned_write_capacity_units : Int64 | Nil = nil,
      @provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
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

      if value = @provisioned_read_capacity_auto_scaling_settings
        value.validate!
      end

      if value = @provisioned_write_capacity_units
        raise Core::ValidationError.new("ProvisionedWriteCapacityUnits value must be >= 1") if value < 1
      end

      if value = @provisioned_write_capacity_auto_scaling_settings
        value.validate!
      end
    end

    def_equals_and_hash(@index_name, @index_status, @provisioned_read_capacity_units, @provisioned_read_capacity_auto_scaling_settings, @provisioned_write_capacity_units, @provisioned_write_capacity_auto_scaling_settings)
  end
end
