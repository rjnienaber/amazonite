private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class UpdateTableInput
    include JSON::Serializable

    @[JSON::Field(key: "AttributeDefinitions")]
    property attribute_definitions : Array(AttributeDefinition) | Nil

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexUpdates")]
    property global_secondary_index_updates : Array(GlobalSecondaryIndexUpdate) | Nil

    @[JSON::Field(key: "StreamSpecification")]
    property stream_specification : StreamSpecification | Nil

    @[JSON::Field(key: "SSESpecification")]
    property sse_specification : SSESpecification | Nil

    @[JSON::Field(key: "ReplicaUpdates")]
    property replica_updates : Array(ReplicationGroupUpdate) | Nil

    @[JSON::Field(key: "TableClass", converter: ADDB::TableClass)]
    property table_class : TableClass | Nil

    @[JSON::Field(key: "DeletionProtectionEnabled")]
    property deletion_protection_enabled : Bool | Nil

    @[JSON::Field(key: "MultiRegionConsistency", converter: ADDB::MultiRegionConsistency)]
    property multi_region_consistency : MultiRegionConsistency | Nil

    @[JSON::Field(key: "GlobalTableWitnessUpdates")]
    property global_table_witness_updates : Array(GlobalTableWitnessGroupUpdate) | Nil

    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : WarmThroughput | Nil

    @[JSON::Field(key: "GlobalTableSettingsReplicationMode", converter: ADDB::GlobalTableSettingsReplicationMode)]
    property global_table_settings_replication_mode : GlobalTableSettingsReplicationMode | Nil

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
  end
end
