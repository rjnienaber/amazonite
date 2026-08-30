module Amazonite::DynamoDBV2
  # Represents the auto scaling settings of a global secondary index for a replica that will be
  # modified.
  class ReplicaGlobalSecondaryIndexAutoScalingUpdate
    include JSON::Serializable

    # The name of the global secondary index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingUpdate")]
    property provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @provisioned_read_capacity_auto_scaling_update : AutoScalingSettingsUpdate | Nil = nil,
    )
    end

    def_equals_and_hash(@index_name, @provisioned_read_capacity_auto_scaling_update)
  end
end
