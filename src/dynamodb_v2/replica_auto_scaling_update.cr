private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the auto scaling settings of a replica that will be modified.
  class ReplicaAutoScalingUpdate
    include JSON::Serializable

    # The Region where the replica exists.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    # Represents the auto scaling settings of global secondary indexes that will be modified.
    @[JSON::Field(key: "ReplicaGlobalSecondaryIndexUpdates")]
    property replica_global_secondary_index_updates : Array(ReplicaGlobalSecondaryIndexAutoScalingUpdate) | Nil

    @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingUpdate")]
    property replica_provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @region_name : String,
      @replica_global_secondary_index_updates : Array(ReplicaGlobalSecondaryIndexAutoScalingUpdate) | Nil = nil,
      @replica_provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @replica_global_secondary_index_updates
        value.each(&.validate!)
      end

      if value = @replica_provisioned_read_capacity_auto_scaling_update
        value.validate!
      end
    end

    def_equals_and_hash(@region_name, @replica_global_secondary_index_updates, @replica_provisioned_read_capacity_auto_scaling_update)
  end
end
