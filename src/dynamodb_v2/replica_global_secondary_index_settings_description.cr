private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ReplicaGlobalSecondaryIndexSettingsDescription
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "IndexStatus", converter: ADDB::IndexStatus)]
    property index_status : IndexStatus | Nil

    @[JSON::Field(key: "ProvisionedReadCapacityUnits")]
    property provisioned_read_capacity_units : Int64 | Nil

    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettings")]
    property provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    @[JSON::Field(key: "ProvisionedWriteCapacityUnits")]
    property provisioned_write_capacity_units : Int64 | Nil

    @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingSettings")]
    property provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    def initialize(
      @index_name : String,
      @index_status : IndexStatus | Nil = nil,
      @provisioned_read_capacity_units : Int64 | Nil = nil,
      @provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @provisioned_write_capacity_units : Int64 | Nil = nil,
      @provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil
    )
    end
  end
end