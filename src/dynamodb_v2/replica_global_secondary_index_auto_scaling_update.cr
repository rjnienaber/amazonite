module Amazonite::DynamoDBv2
  class ReplicaGlobalSecondaryIndexAutoScalingUpdate
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingUpdate")]
    property provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil = nil
    )
    end
  end
end