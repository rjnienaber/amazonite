private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class UpdateGlobalTableSettingsInput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    @[JSON::Field(key: "GlobalTableBillingMode", converter: ADDB::BillingMode)]
    property global_table_billing_mode : BillingMode | Nil

    @[JSON::Field(key: "GlobalTableProvisionedWriteCapacityUnits")]
    property global_table_provisioned_write_capacity_units : Int64 | Nil

    @[JSON::Field(key: "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate")]
    property global_table_provisioned_write_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil

    @[JSON::Field(key: "GlobalTableGlobalSecondaryIndexSettingsUpdate")]
    property global_table_global_secondary_index_settings_update : Array(GlobalTableGlobalSecondaryIndexSettingsUpdate) | Nil

    @[JSON::Field(key: "ReplicaSettingsUpdate")]
    property replica_settings_update : Array(ReplicaSettingsUpdate) | Nil

    def initialize(
      @global_table_name : String,
      @global_table_billing_mode : BillingMode | Nil = nil,
      @global_table_provisioned_write_capacity_units : Int64 | Nil = nil,
      @global_table_provisioned_write_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil = nil,
      @global_table_global_secondary_index_settings_update : Array(GlobalTableGlobalSecondaryIndexSettingsUpdate) | Nil = nil,
      @replica_settings_update : Array(ReplicaSettingsUpdate) | Nil = nil
    )
    end
  end
end
