private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ReplicaAutoScalingDescription
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(ReplicaGlobalSecondaryIndexAutoScalingDescription) | Nil

    @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettings")]
    property replica_provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    @[JSON::Field(key: "ReplicaProvisionedWriteCapacityAutoScalingSettings")]
    property replica_provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    @[JSON::Field(key: "ReplicaStatus", converter: ADDB::ReplicaStatus)]
    property replica_status : ReplicaStatus | Nil

    def initialize(
      @region_name : String | Nil = nil,
      @global_secondary_indexes : Array(ReplicaGlobalSecondaryIndexAutoScalingDescription) | Nil = nil,
      @replica_provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @replica_provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @replica_status : ReplicaStatus | Nil = nil
    )
    end
  end
end
