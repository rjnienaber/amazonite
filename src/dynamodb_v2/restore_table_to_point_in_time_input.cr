private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class RestoreTableToPointInTimeInput
    include JSON::Serializable

    @[JSON::Field(key: "SourceTableArn")]
    property source_table_arn : String | Nil

    @[JSON::Field(key: "SourceTableName")]
    property source_table_name : String | Nil

    @[JSON::Field(key: "TargetTableName")]
    property target_table_name : String

    @[JSON::Field(key: "UseLatestRestorableTime")]
    property use_latest_restorable_time : Bool | Nil

    @[JSON::Field(key: "RestoreDateTime", converter: Core::AWSEpochConverter)]
    property restore_date_time : Time | Nil

    @[JSON::Field(key: "BillingModeOverride", converter: ADDB::BillingMode)]
    property billing_mode_override : BillingMode | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexOverride")]
    property global_secondary_index_override : Array(GlobalSecondaryIndex) | Nil

    @[JSON::Field(key: "LocalSecondaryIndexOverride")]
    property local_secondary_index_override : Array(LocalSecondaryIndex) | Nil

    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughput | Nil

    @[JSON::Field(key: "SSESpecificationOverride")]
    property sse_specification_override : SSESpecification | Nil

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
      @sse_specification_override : SSESpecification | Nil = nil
    )
    end
  end
end
