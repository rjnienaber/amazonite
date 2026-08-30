private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the auto scaling settings of the replica.
  class ReplicaAutoScalingDescription
    include JSON::Serializable

    # The Region where the replica exists.
    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    # Replica-specific global secondary index auto scaling settings.
    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(ReplicaGlobalSecondaryIndexAutoScalingDescription) | Nil

    @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettings")]
    property replica_provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    @[JSON::Field(key: "ReplicaProvisionedWriteCapacityAutoScalingSettings")]
    property replica_provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    # The current state of the replica:
    #
    # - `CREATING` - The replica is being created.
    #
    # - `UPDATING` - The replica is being updated.
    #
    # - `DELETING` - The replica is being deleted.
    #
    # - `ACTIVE` - The replica is ready for use.
    @[JSON::Field(key: "ReplicaStatus", converter: ADDB::ReplicaStatus)]
    property replica_status : ReplicaStatus | Nil

    def initialize(
      @region_name : String | Nil = nil,
      @global_secondary_indexes : Array(ReplicaGlobalSecondaryIndexAutoScalingDescription) | Nil = nil,
      @replica_provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @replica_provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @replica_status : ReplicaStatus | Nil = nil,
    )
    end
  end
end
