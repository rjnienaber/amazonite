private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the properties of a global secondary index.
  class ReplicaGlobalSecondaryIndexSettingsDescription
    include JSON::Serializable

    # The name of the global secondary index. The name must be unique among all other indexes on this
    # table.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    # The current status of the global secondary index:
    #
    # - `CREATING` - The global secondary index is being created.
    #
    # - `UPDATING` - The global secondary index is being updated.
    #
    # - `DELETING` - The global secondary index is being deleted.
    #
    # - `ACTIVE` - The global secondary index is ready for use.
    @[JSON::Field(key: "IndexStatus", converter: ADDB::IndexStatus)]
    property index_status : IndexStatus | Nil

    # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
    # `ThrottlingException`.
    @[JSON::Field(key: "ProvisionedReadCapacityUnits")]
    property provisioned_read_capacity_units : Int64 | Nil

    # Auto scaling settings for a global secondary index replica's read capacity units.
    @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettings")]
    property provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    # The maximum number of writes consumed per second before DynamoDB returns a
    # `ThrottlingException`.
    @[JSON::Field(key: "ProvisionedWriteCapacityUnits")]
    property provisioned_write_capacity_units : Int64 | Nil

    # Auto scaling settings for a global secondary index replica's write capacity units.
    @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingSettings")]
    property provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    def initialize(
      @index_name : String,
      @index_status : IndexStatus | Nil = nil,
      @provisioned_read_capacity_units : Int64 | Nil = nil,
      @provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
      @provisioned_write_capacity_units : Int64 | Nil = nil,
      @provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil = nil,
    )
    end
  end
end
