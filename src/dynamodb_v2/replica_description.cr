private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains the details of the replica.
  class ReplicaDescription
    include JSON::Serializable

    # The name of the Region.
    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    # The current state of the replica:
    #
    # - `CREATING` - The replica is being created.
    #
    # - `UPDATING` - The replica is being updated.
    #
    # - `DELETING` - The replica is being deleted.
    #
    # - `ACTIVE` - The replica is ready for use.
    #
    # - `REGION_DISABLED` - The replica is inaccessible because the Amazon Web Services Region has
    # been disabled.
    #
    # If the Amazon Web Services Region remains inaccessible for more than 20 hours, DynamoDB will
    # remove this replica from the replication group. The replica will not be deleted and replication
    # will stop from and to this region.
    #
    # - `INACCESSIBLE_ENCRYPTION_CREDENTIALS ` - The KMS key used to encrypt the table is
    # inaccessible.
    #
    # If the KMS key remains inaccessible for more than 20 hours, DynamoDB will remove this replica
    # from the replication group. The replica will not be deleted and replication will stop from and
    # to this region.
    @[JSON::Field(key: "ReplicaStatus", converter: ADDB::ReplicaStatus)]
    property replica_status : ReplicaStatus | Nil

    # The Amazon Resource Name (ARN) of the global table replica.
    @[JSON::Field(key: "ReplicaArn")]
    property replica_arn : String | Nil

    # Detailed information about the replica status.
    @[JSON::Field(key: "ReplicaStatusDescription")]
    property replica_status_description : String | Nil

    # Specifies the progress of a Create, Update, or Delete action on the replica as a percentage.
    @[JSON::Field(key: "ReplicaStatusPercentProgress")]
    property replica_status_percent_progress : String | Nil

    # The KMS key of the replica that will be used for KMS encryption.
    @[JSON::Field(key: "KMSMasterKeyId")]
    property kms_master_key_id : String | Nil

    # Replica-specific provisioned throughput. If not described, uses the source table's provisioned
    # throughput settings.
    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    # Overrides the maximum on-demand throughput settings for the specified replica table.
    @[JSON::Field(key: "OnDemandThroughputOverride")]
    property on_demand_throughput_override : OnDemandThroughputOverride | Nil

    # Represents the warm throughput value for this replica.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : TableWarmThroughputDescription | Nil

    # Replica-specific global secondary index settings.
    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(ReplicaGlobalSecondaryIndexDescription) | Nil

    # The time at which the replica was first detected as inaccessible. To determine cause of
    # inaccessibility check the `ReplicaStatus` property.
    @[JSON::Field(key: "ReplicaInaccessibleDateTime", converter: Core::AWSEpochConverter)]
    property replica_inaccessible_date_time : Time | Nil

    @[JSON::Field(key: "ReplicaTableClassSummary")]
    property replica_table_class_summary : TableClassSummary | Nil

    # Indicates one of the settings synchronization modes for the global table replica:
    #
    # - `ENABLED`: Indicates that the settings synchronization mode for the global table replica is
    # enabled.
    #
    # - `DISABLED`: Indicates that the settings synchronization mode for the global table replica is
    # disabled.
    #
    # - `ENABLED_WITH_OVERRIDES`: This mode is set by default for a same account global table.
    # Indicates that certain global table settings can be overridden.
    @[JSON::Field(key: "GlobalTableSettingsReplicationMode", converter: ADDB::GlobalTableSettingsReplicationMode)]
    property global_table_settings_replication_mode : GlobalTableSettingsReplicationMode | Nil

    def initialize(
      @region_name : String | Nil = nil,
      @replica_status : ReplicaStatus | Nil = nil,
      @replica_arn : String | Nil = nil,
      @replica_status_description : String | Nil = nil,
      @replica_status_percent_progress : String | Nil = nil,
      @kms_master_key_id : String | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil,
      @on_demand_throughput_override : OnDemandThroughputOverride | Nil = nil,
      @warm_throughput : TableWarmThroughputDescription | Nil = nil,
      @global_secondary_indexes : Array(ReplicaGlobalSecondaryIndexDescription) | Nil = nil,
      @replica_inaccessible_date_time : Time | Nil = nil,
      @replica_table_class_summary : TableClassSummary | Nil = nil,
      @global_table_settings_replication_mode : GlobalTableSettingsReplicationMode | Nil = nil,
    )
    end
  end
end
