private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ReplicaSettingsDescription
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String

    @[JSON::Field(key: "ReplicaStatus", converter: ADDB::ReplicaStatus)]
    property replica_status : ReplicaStatus | Nil

    @[JSON::Field(key: "ReplicaBillingModeSummary")]
    property replica_billing_mode_summary : BillingModeSummary | Nil

    @[JSON::Field(key: "ReplicaProvisionedReadCapacityUnits")]
    property replica_provisioned_read_capacity_units : Int64 | Nil

    @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettings")]
    property replica_provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    @[JSON::Field(key: "ReplicaProvisionedWriteCapacityUnits")]
    property replica_provisioned_write_capacity_units : Int64 | Nil

    @[JSON::Field(key: "ReplicaProvisionedWriteCapacityAutoScalingSettings")]
    property replica_provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    @[JSON::Field(key: "ReplicaGlobalSecondaryIndexSettings")]
    property replica_global_secondary_index_settings : Array(ReplicaGlobalSecondaryIndexSettingsDescription) | Nil

    @[JSON::Field(key: "ReplicaTableClassSummary")]
    property replica_table_class_summary : TableClassSummary | Nil

    def initialize(
      @region_name : String,
      @replica_status : ReplicaStatus | Nil = nil,
      @replica_billing_mode_summary : BillingModeSummary | Nil = nil,
      @replica_provisioned_read_capacity_units : Int64 | Nil = nil,
      @replica_provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @replica_provisioned_write_capacity_units : Int64 | Nil = nil,
      @replica_provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @replica_global_secondary_index_settings : Array(ReplicaGlobalSecondaryIndexSettingsDescription) | Nil = nil,
      @replica_table_class_summary : TableClassSummary | Nil = nil
    )
    end
  end
end