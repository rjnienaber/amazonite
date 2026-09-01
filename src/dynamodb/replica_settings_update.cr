private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents the settings for a global table in a Region that will be modified.
  class ReplicaSettingsUpdate
    include JSON::Serializable

    # The Region of the replica to be added.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
    # `ThrottlingException`. For more information, see [Specifying Read and Write
    # Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ReplicaProvisionedReadCapacityUnits")]
    property replica_provisioned_read_capacity_units : Int64 | Nil

    # Auto scaling settings for managing a global table replica's read capacity units.
    @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate")]
    property replica_provisioned_read_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil

    # Represents the settings of a global secondary index for a global table that will be modified.
    @[JSON::Field(key: "ReplicaGlobalSecondaryIndexSettingsUpdate")]
    property replica_global_secondary_index_settings_update : Array(ReplicaGlobalSecondaryIndexSettingsUpdate) | Nil

    # Replica-specific table class. If not specified, uses the source table's table class.
    @[JSON::Field(key: "ReplicaTableClass", converter: ADDB::TableClass)]
    property replica_table_class : TableClass | Nil

    def initialize(
      @region_name : String,
      @replica_provisioned_read_capacity_units : Int64 | Nil = nil,
      @replica_provisioned_read_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil = nil,
      @replica_global_secondary_index_settings_update : Array(ReplicaGlobalSecondaryIndexSettingsUpdate) | Nil = nil,
      @replica_table_class : TableClass | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @replica_provisioned_read_capacity_units
        raise Core::ValidationError.new("ReplicaProvisionedReadCapacityUnits value must be >= 1") if value < 1
      end

      if value = @replica_provisioned_read_capacity_auto_scaling_settings_update
        value.validate!
      end

      if value = @replica_global_secondary_index_settings_update
        raise Core::ValidationError.new("ReplicaGlobalSecondaryIndexSettingsUpdate must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("ReplicaGlobalSecondaryIndexSettingsUpdate must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@region_name, @replica_provisioned_read_capacity_units, @replica_provisioned_read_capacity_auto_scaling_settings_update, @replica_global_secondary_index_settings_update, @replica_table_class)
  end
end
