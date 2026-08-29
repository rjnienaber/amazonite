private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class RestoreTableFromBackupInput
    include JSON::Serializable

    # The name of the new table to which the backup must be restored.
    @[JSON::Field(key: "TargetTableName")]
    property target_table_name : String

    # The Amazon Resource Name (ARN) associated with the backup.
    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    # The billing mode of the restored table.
    @[JSON::Field(key: "BillingModeOverride", converter: ADDB::BillingMode)]
    property billing_mode_override : BillingMode | Nil

    # List of global secondary indexes for the restored table. The indexes provided should match
    # existing secondary indexes. You can choose to exclude some or all of the indexes at the time of
    # restore.
    @[JSON::Field(key: "GlobalSecondaryIndexOverride")]
    property global_secondary_index_override : Array(GlobalSecondaryIndex) | Nil

    # List of local secondary indexes for the restored table. The indexes provided should match
    # existing secondary indexes. You can choose to exclude some or all of the indexes at the time of
    # restore.
    @[JSON::Field(key: "LocalSecondaryIndexOverride")]
    property local_secondary_index_override : Array(LocalSecondaryIndex) | Nil

    # Provisioned throughput settings for the restored table.
    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughput | Nil

    @[JSON::Field(key: "OnDemandThroughputOverride")]
    property on_demand_throughput_override : OnDemandThroughput | Nil

    # The new server-side encryption settings for the restored table.
    @[JSON::Field(key: "SSESpecificationOverride")]
    property sse_specification_override : SSESpecification | Nil

    # The vector indexes for the restored table. If not specified, all vector indexes from the backup
    # are restored. The indexes provided must match existing vector indexes from the backup. You can
    # choose to exclude some or all of the vector indexes at the time of restore.
    @[JSON::Field(key: "VectorIndexOverride")]
    property vector_index_override : Array(VectorIndex) | Nil

    def initialize(
      @target_table_name : String,
      @backup_arn : String,
      @billing_mode_override : BillingMode | Nil = nil,
      @global_secondary_index_override : Array(GlobalSecondaryIndex) | Nil = nil,
      @local_secondary_index_override : Array(LocalSecondaryIndex) | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughput | Nil = nil,
      @on_demand_throughput_override : OnDemandThroughput | Nil = nil,
      @sse_specification_override : SSESpecification | Nil = nil,
      @vector_index_override : Array(VectorIndex) | Nil = nil,
    )
    end
  end
end
