private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @target_table_name
        raise Core::ValidationError.new("TargetTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("TargetTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("TargetTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @backup_arn
        raise Core::ValidationError.new("BackupArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("BackupArn length must be <= 1024") if value.size > 1024
      end

      if value = @global_secondary_index_override
        value.each(&.validate!)
      end

      if value = @local_secondary_index_override
        value.each(&.validate!)
      end

      if value = @provisioned_throughput_override
        value.validate!
      end

      if value = @on_demand_throughput_override
        value.validate!
      end

      if value = @sse_specification_override
        value.validate!
      end

      if value = @vector_index_override
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@target_table_name, @backup_arn, @billing_mode_override, @global_secondary_index_override, @local_secondary_index_override, @provisioned_throughput_override, @on_demand_throughput_override, @sse_specification_override, @vector_index_override)
  end
end
