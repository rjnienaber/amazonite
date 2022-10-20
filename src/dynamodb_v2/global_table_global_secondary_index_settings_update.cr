module Amazonite::DynamoDBv2
  class GlobalTableGlobalSecondaryIndexSettingsUpdate
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "ProvisionedWriteCapacityUnits")]
    property provisioned_write_capacity_units : Int64 | Nil

    @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingSettingsUpdate")]
    property provisioned_write_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @index_name : String,
      @provisioned_write_capacity_units : Int64 | Nil = nil,
      @provisioned_write_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil = nil
    )
    end
  end
end
