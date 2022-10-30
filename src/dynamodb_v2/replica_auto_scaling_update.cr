module Amazonite::DynamoDBV2
  class ReplicaAutoScalingUpdate
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String

    @[JSON::Field(key: "ReplicaGlobalSecondaryIndexUpdates")]
    property replica_global_secondary_index_updates : Array(ReplicaGlobalSecondaryIndexAutoScalingUpdate) | Nil

    @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingUpdate")]
    property replica_provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @region_name : String,
      @replica_global_secondary_index_updates : Array(ReplicaGlobalSecondaryIndexAutoScalingUpdate) | Nil = nil,
      @replica_provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil = nil
    )
    end
  end
end
