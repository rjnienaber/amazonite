private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ReplicaSettingsUpdate
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String

    @[JSON::Field(key: "ReplicaProvisionedReadCapacityUnits")]
    property replica_provisioned_read_capacity_units : Int64 | Nil

    @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate")]
    property replica_provisioned_read_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil

    @[JSON::Field(key: "ReplicaGlobalSecondaryIndexSettingsUpdate")]
    property replica_global_secondary_index_settings_update : Array(ReplicaGlobalSecondaryIndexSettingsUpdate) | Nil

    @[JSON::Field(key: "ReplicaTableClass", converter: ADDB::TableClass)]
    property replica_table_class : TableClass | Nil

    def initialize(
      @region_name : String,
      @replica_provisioned_read_capacity_units : Int64 | Nil = nil,
      @replica_provisioned_read_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil = nil,
      @replica_global_secondary_index_settings_update : Array(ReplicaGlobalSecondaryIndexSettingsUpdate) | Nil = nil,
      @replica_table_class : TableClass | Nil = nil
    )
    end
  end
end
