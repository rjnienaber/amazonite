private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the auto scaling configuration for a replica global secondary index.
  class ReplicaGlobalSecondaryIndexAutoScalingDescription
    include JSON::Serializable

    # The name of the global secondary index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # The current state of the replica global secondary index:
    #
    # - `CREATING` - The index is being created.
    #
    # - `UPDATING` - The table/index configuration is being updated. The table/index remains available
    # for data operations when `UPDATING`
    #
    # - `DELETING` - The index is being deleted.
    #
    # - `ACTIVE` - The index is ready for use.
    @[JSON::Field(key: "IndexStatus", converter: ADDB::IndexStatus)]
    property index_status : IndexStatus | Nil

    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettings")]
    property provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingSettings")]
    property provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @index_status : IndexStatus | Nil = nil,
      @provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
    )
    end
  end
end
