private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the properties of a replica.
  class ReplicaSettingsDescription
    include JSON::Serializable

    # The Region name of the replica.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    # The current state of the Region:
    #
    # - `CREATING` - The Region is being created.
    #
    # - `UPDATING` - The Region is being updated.
    #
    # - `DELETING` - The Region is being deleted.
    #
    # - `ACTIVE` - The Region is ready for use.
    @[JSON::Field(key: "ReplicaStatus", converter: ADDB::ReplicaStatus)]
    property replica_status : ReplicaStatus | Nil

    # The read/write capacity mode of the replica.
    @[JSON::Field(key: "ReplicaBillingModeSummary")]
    property replica_billing_mode_summary : BillingModeSummary | Nil

    # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
    # `ThrottlingException`. For more information, see [Specifying Read and Write
    # Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ReplicaProvisionedReadCapacityUnits")]
    property replica_provisioned_read_capacity_units : Int64 | Nil

    # Auto scaling settings for a global table replica's read capacity units.
    @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettings")]
    property replica_provisioned_read_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    # The maximum number of writes consumed per second before DynamoDB returns a
    # `ThrottlingException`. For more information, see [Specifying Read and Write
    # Requirements](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ReplicaProvisionedWriteCapacityUnits")]
    property replica_provisioned_write_capacity_units : Int64 | Nil

    # Auto scaling settings for a global table replica's write capacity units.
    @[JSON::Field(key: "ReplicaProvisionedWriteCapacityAutoScalingSettings")]
    property replica_provisioned_write_capacity_auto_scaling_settings : AutoScalingSettingsDescription | Nil

    # Replica global secondary index settings for the global table.
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
      @replica_table_class_summary : TableClassSummary | Nil = nil,
    )
    end

    def_equals_and_hash(@region_name, @replica_status, @replica_billing_mode_summary, @replica_provisioned_read_capacity_units, @replica_provisioned_read_capacity_auto_scaling_settings, @replica_provisioned_write_capacity_units, @replica_provisioned_write_capacity_auto_scaling_settings, @replica_global_secondary_index_settings, @replica_table_class_summary)
  end
end
