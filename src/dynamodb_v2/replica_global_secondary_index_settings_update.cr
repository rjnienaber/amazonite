module Amazonite::DynamoDBV2
  class ReplicaGlobalSecondaryIndexSettingsUpdate
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "ProvisionedReadCapacityUnits")]
    property provisioned_read_capacity_units : Int64 | Nil

    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettingsUpdate")]
    property provisioned_read_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @index_name : String,
      @provisioned_read_capacity_units : Int64 | Nil = nil,
      @provisioned_read_capacity_auto_scaling_settings_update : AutoScalingSettingsUpdate | Nil = nil
    )
    end
  end
end
