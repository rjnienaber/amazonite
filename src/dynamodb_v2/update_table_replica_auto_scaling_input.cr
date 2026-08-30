module Amazonite::DynamoDBV2
  class UpdateTableReplicaAutoScalingInput
    include JSON::Serializable

    # Represents the auto scaling settings of the global secondary indexes of the replica to be
    # updated.
    @[JSON::Field(key: "GlobalSecondaryIndexUpdates")]
    property global_secondary_index_updates : Array(GlobalSecondaryIndexAutoScalingUpdate) | Nil

    # The name of the global table to be updated. You can also provide the Amazon Resource Name (ARN)
    # of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingUpdate")]
    property provisioned_write_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil

    # Represents the auto scaling settings of replicas of the table that will be modified.
    @[JSON::Field(key: "ReplicaUpdates")]
    property replica_updates : Array(ReplicaAutoScalingUpdate) | Nil

    def initialize(
      @table_name : String,
      @global_secondary_index_updates : Array(GlobalSecondaryIndexAutoScalingUpdate) | Nil = nil,
      @provisioned_write_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil = nil,
      @replica_updates : Array(ReplicaAutoScalingUpdate) | Nil = nil,
    )
    end

    def_equals_and_hash(@global_secondary_index_updates, @table_name, @provisioned_write_capacity_auto_scaling_update, @replica_updates)
  end
end
