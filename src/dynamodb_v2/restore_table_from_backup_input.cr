private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class RestoreTableFromBackupInput
    include JSON::Serializable

    @[JSON::Field(key: "TargetTableName")]
    property target_table_name : String

    @[JSON::Field(key: "BackupArn")]
    property backup_arn : String

    @[JSON::Field(key: "BillingModeOverride", converter: ADDB::BillingMode)]
    property billing_mode_override : BillingMode | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexOverride")]
    property global_secondary_index_override : Array(GlobalSecondaryIndex) | Nil

    @[JSON::Field(key: "LocalSecondaryIndexOverride")]
    property local_secondary_index_override : Array(LocalSecondaryIndex) | Nil

    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughput | Nil

    @[JSON::Field(key: "SSESpecificationOverride")]
    property ssespecification_override : SSESpecification | Nil

    def initialize(
      @target_table_name : String,
      @backup_arn : String,
      @billing_mode_override : BillingMode | Nil = nil,
      @global_secondary_index_override : Array(GlobalSecondaryIndex) | Nil = nil,
      @local_secondary_index_override : Array(LocalSecondaryIndex) | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughput | Nil = nil,
      @ssespecification_override : SSESpecification | Nil = nil
    )
    end
  end
end