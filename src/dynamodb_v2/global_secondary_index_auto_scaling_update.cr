module Amazonite::DynamoDBV2
  class GlobalSecondaryIndexAutoScalingUpdate
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingUpdate")]
    property provisioned_write_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @provisioned_write_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil = nil
    )
    end
  end
end
