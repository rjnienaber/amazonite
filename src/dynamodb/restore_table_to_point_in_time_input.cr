private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class RestoreTableToPointInTimeInput
    include JSON::Serializable

    # The DynamoDB table that will be restored. This value is an Amazon Resource Name (ARN).
    @[JSON::Field(key: "SourceTableArn")]
    property source_table_arn : String | Nil

    # Name of the source table that is being restored.
    @[JSON::Field(key: "SourceTableName")]
    property source_table_name : String | Nil

    # The name of the new table to which it must be restored to.
    @[JSON::Field(key: "TargetTableName")]
    property target_table_name : String

    # Restore the table to the latest possible time. `LatestRestorableDateTime` is typically 5 minutes
    # before the current time.
    @[JSON::Field(key: "UseLatestRestorableTime")]
    property use_latest_restorable_time : Bool | Nil

    # Time in the past to restore the table to.
    @[JSON::Field(key: "RestoreDateTime", converter: Core::AWSEpochConverter)]
    property restore_date_time : Time | Nil

    # The billing mode of the restored table.
    @[JSON::Field(key: "BillingModeOverride", converter: ADDB::BillingMode)]
    property billing_mode_override : BillingMode | Nil

    # List of global secondary indexes for the restored table. The indexes provided should match
    # existing secondary indexes. You can choose to exclude some or all of the indexes at the time of
    # restore.
    #
    # The `WarmThroughput` setting is not supported on global secondary indexes when you use
    # `RestoreTableToPointInTime`. Although `WarmThroughput` appears in the shared index definition,
    # including it in a `GlobalSecondaryIndexOverride` entry causes the request to fail with a
    # validation error.
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

    # The vector indexes for the restored table. If not specified, all vector indexes from the source
    # table are restored. The indexes provided must match existing vector indexes from the source
    # table. You can choose to exclude some or all of the vector indexes at the time of restore.
    @[JSON::Field(key: "VectorIndexOverride")]
    property vector_index_override : Array(VectorIndex) | Nil

    def initialize(
      @target_table_name : String,
      @source_table_arn : String | Nil = nil,
      @source_table_name : String | Nil = nil,
      @use_latest_restorable_time : Bool | Nil = nil,
      @restore_date_time : Time | Nil = nil,
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
      if value = @source_table_arn
        raise Core::ValidationError.new("SourceTableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SourceTableArn length must be <= 1024") if value.size > 1024
      end

      if value = @source_table_name
        raise Core::ValidationError.new("SourceTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("SourceTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("SourceTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @target_table_name
        raise Core::ValidationError.new("TargetTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("TargetTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("TargetTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
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

    def_equals_and_hash(@source_table_arn, @source_table_name, @target_table_name, @use_latest_restorable_time, @restore_date_time, @billing_mode_override, @global_secondary_index_override, @local_secondary_index_override, @provisioned_throughput_override, @on_demand_throughput_override, @sse_specification_override, @vector_index_override)
  end
end
