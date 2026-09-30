private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents the input of an `UpdateTable` operation.
  class UpdateTableInput
    include JSON::Serializable

    # An array of attributes that describe the key schema for the table and indexes. If you are adding
    # a new global secondary index to the table, `AttributeDefinitions` must include the key
    # element(s) of the new index.
    @[JSON::Field(key: "AttributeDefinitions")]
    property attribute_definitions : Array(AttributeDefinition) | Nil

    # The name of the table to be updated. You can also provide the Amazon Resource Name (ARN) of the
    # table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # Controls how you are charged for read and write throughput and how you manage capacity. When
    # switching from pay-per-request to provisioned capacity, initial provisioned capacity values must
    # be set. The initial provisioned capacity values are estimated based on the consumed read and
    # write capacity of your table and global secondary indexes over the past 30 minutes.
    #
    # - `PAY_PER_REQUEST` - We recommend using `PAY_PER_REQUEST` for most DynamoDB workloads.
    # `PAY_PER_REQUEST` sets the billing mode to [On-demand capacity
    # mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/on-demand-capacity-mode.html).
    #
    # - `PROVISIONED` - We recommend using `PROVISIONED` for steady workloads with predictable growth
    # where capacity requirements can be reliably forecasted. `PROVISIONED` sets the billing mode to
    # [Provisioned capacity
    # mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html).
    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    # The new provisioned throughput settings for the specified table or index.
    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    # An array of one or more global secondary indexes for the table. For each index in the array, you
    # can request one action:
    #
    # - `Create` - add a new global secondary index to the table.
    #
    # - `Update` - modify the provisioned throughput settings of an existing global secondary index.
    #
    # - `Delete` - remove a global secondary index from the table.
    #
    # You can create or delete only one global secondary index per `UpdateTable` operation.
    #
    # For more information, see [Managing Global Secondary
    # Indexes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html) in
    # the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "GlobalSecondaryIndexUpdates")]
    property global_secondary_index_updates : Array(GlobalSecondaryIndexUpdate) | Nil

    # Represents the DynamoDB Streams configuration for the table.
    #
    # You receive a `ValidationException` if you try to enable a stream on a table that already has a
    # stream, or if you try to disable a stream on a table that doesn't have a stream.
    @[JSON::Field(key: "StreamSpecification")]
    property stream_specification : StreamSpecification | Nil

    # The new server-side encryption settings for the specified table.
    @[JSON::Field(key: "SSESpecification")]
    property sse_specification : SSESpecification | Nil

    # A list of replica update actions (create, delete, or update) for the table.
    @[JSON::Field(key: "ReplicaUpdates")]
    property replica_updates : Array(ReplicationGroupUpdate) | Nil

    # The table class of the table to be updated. Valid values are `STANDARD` and
    # `STANDARD_INFREQUENT_ACCESS`.
    @[JSON::Field(key: "TableClass", converter: ADDB::TableClass)]
    property table_class : TableClass | Nil

    # Indicates whether deletion protection is to be enabled (true) or disabled (false) on the table.
    @[JSON::Field(key: "DeletionProtectionEnabled")]
    property deletion_protection_enabled : Bool | Nil

    # Specifies the consistency mode for a new global table. This parameter is only valid when you
    # create a global table by specifying one or more
    # [Create](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_ReplicationGroupUpdate.html#DDB-Type-ReplicationGroupUpdate-Create)
    # actions in the
    # [ReplicaUpdates](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_UpdateTable.html#DDB-UpdateTable-request-ReplicaUpdates)
    # action list.
    #
    # You can specify one of the following consistency modes:
    #
    # - `EVENTUAL`: Configures a new global table for multi-Region eventual consistency (MREC). This
    # is the default consistency mode for global tables.
    #
    # - `STRONG`: Configures a new global table for multi-Region strong consistency (MRSC).
    #
    # If you don't specify this field, the global table consistency mode defaults to `EVENTUAL`. For
    # more information about global tables consistency modes, see [ Consistency
    # modes](https://docs.aws.amazon.com/V2globaltables_HowItWorks.html#V2globaltables_HowItWorks.consistency-modes)
    # in DynamoDB developer guide.
    @[JSON::Field(key: "MultiRegionConsistency", converter: ADDB::MultiRegionConsistency)]
    property multi_region_consistency : MultiRegionConsistency | Nil

    # A list of witness updates for a MRSC global table. A witness provides a cost-effective
    # alternative to a full replica in a MRSC global table by maintaining replicated change data
    # written to global table replicas. You cannot perform read or write operations on a witness. For
    # each witness, you can request one action:
    #
    # - `Create` - add a new witness to the global table.
    #
    # - `Delete` - remove a witness from the global table.
    #
    # You can create or delete only one witness per `UpdateTable` operation.
    #
    # For more information, see [Multi-Region strong consistency
    # (MRSC)](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/V2globaltables_HowItWorks.html#V2globaltables_HowItWorks.consistency-modes)
    # in the Amazon DynamoDB Developer Guide
    @[JSON::Field(key: "GlobalTableWitnessUpdates")]
    property global_table_witness_updates : Array(GlobalTableWitnessGroupUpdate) | Nil

    # Updates the maximum number of read and write units for the specified table in on-demand capacity
    # mode. If you use this parameter, you must specify `MaxReadRequestUnits`, `MaxWriteRequestUnits`,
    # or both.
    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    # Represents the warm throughput (in read units per second and write units per second) for
    # updating a table.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : WarmThroughput | Nil

    # Controls the settings replication mode for a global table replica. This attribute can be defined
    # using UpdateTable operation only on a regional table with values:
    #
    # - `ENABLED`: Defines settings replication on a regional table to be used as a source table for
    # creating Multi-Account Global Table.
    #
    # - `DISABLED`: Remove settings replication on a regional table. Settings replication needs to be
    # defined to ENABLED again in order to create a Multi-Account Global Table using this table.
    @[JSON::Field(key: "GlobalTableSettingsReplicationMode", converter: ADDB::GlobalTableSettingsReplicationMode)]
    property global_table_settings_replication_mode : GlobalTableSettingsReplicationMode | Nil

    # A list of vector indexes to be added to or removed from the table. You can add or remove one
    # vector index for each `UpdateTable` operation.
    #
    # To add a vector index, specify `IndexName`, `VectorAttribute`, `Dimensions`, `DistanceFunction`,
    # and `Projection`. To remove a vector index, specify only the `IndexName`.
    @[JSON::Field(key: "VectorIndexUpdates")]
    property vector_index_updates : Array(VectorIndexUpdate) | Nil

    def initialize(
      @table_name : String,
      @attribute_definitions : Array(AttributeDefinition) | Nil = nil,
      @billing_mode : BillingMode | Nil = nil,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @global_secondary_index_updates : Array(GlobalSecondaryIndexUpdate) | Nil = nil,
      @stream_specification : StreamSpecification | Nil = nil,
      @sse_specification : SSESpecification | Nil = nil,
      @replica_updates : Array(ReplicationGroupUpdate) | Nil = nil,
      @table_class : TableClass | Nil = nil,
      @deletion_protection_enabled : Bool | Nil = nil,
      @multi_region_consistency : MultiRegionConsistency | Nil = nil,
      @global_table_witness_updates : Array(GlobalTableWitnessGroupUpdate) | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
      @warm_throughput : WarmThroughput | Nil = nil,
      @global_table_settings_replication_mode : GlobalTableSettingsReplicationMode | Nil = nil,
      @vector_index_updates : Array(VectorIndexUpdate) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @attribute_definitions
        value.each(&.validate!)
      end

      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @provisioned_throughput
        value.validate!
      end

      if value = @global_secondary_index_updates
        value.each(&.validate!)
      end

      if value = @stream_specification
        value.validate!
      end

      if value = @sse_specification
        value.validate!
      end

      if value = @replica_updates
        raise Core::ValidationError.new("ReplicaUpdates must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @global_table_witness_updates
        raise Core::ValidationError.new("GlobalTableWitnessUpdates must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("GlobalTableWitnessUpdates must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @on_demand_throughput
        value.validate!
      end

      if value = @warm_throughput
        value.validate!
      end

      if value = @vector_index_updates
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@attribute_definitions, @table_name, @billing_mode, @provisioned_throughput, @global_secondary_index_updates, @stream_specification, @sse_specification, @replica_updates, @table_class, @deletion_protection_enabled, @multi_region_consistency, @global_table_witness_updates, @on_demand_throughput, @warm_throughput, @global_table_settings_replication_mode, @vector_index_updates)
  end
end
