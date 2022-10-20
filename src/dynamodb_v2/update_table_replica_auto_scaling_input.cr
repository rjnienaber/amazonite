module Amazonite::DynamoDBv2
  class UpdateTableReplicaAutoScalingInput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalSecondaryIndexUpdates")]
    property global_secondary_index_updates : Array(GlobalSecondaryIndexAutoScalingUpdate) | Nil

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingUpdate")]
    property provisioned_write_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil

    @[JSON::Field(key: "ReplicaUpdates")]
    property replica_updates : Array(ReplicaAutoScalingUpdate) | Nil

    def initialize(
      @table_name : String,
      @global_secondary_index_updates : Array(GlobalSecondaryIndexAutoScalingUpdate) | Nil = nil,
      @provisioned_write_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil = nil,
      @replica_updates : Array(ReplicaAutoScalingUpdate) | Nil = nil
    )
    end
  end
end
