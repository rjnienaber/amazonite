private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents a replica to be modified.
  class UpdateReplicationGroupMemberAction
    include JSON::Serializable

    # The Region where the replica exists.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    # The KMS key of the replica that should be used for KMS encryption. To specify a key, use its key
    # ID, Amazon Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this
    # parameter if the key is different from the default DynamoDB KMS key `alias/aws/dynamodb`.
    @[JSON::Field(key: "KMSMasterKeyId")]
    property kms_master_key_id : String | Nil

    # Replica-specific provisioned throughput. If not specified, uses the source table's provisioned
    # throughput settings.
    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    # Overrides the maximum on-demand throughput for the replica table.
    @[JSON::Field(key: "OnDemandThroughputOverride")]
    property on_demand_throughput_override : OnDemandThroughputOverride | Nil

    # Replica-specific global secondary index settings.
    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(ReplicaGlobalSecondaryIndex) | Nil

    # Replica-specific table class. If not specified, uses the source table's table class.
    @[JSON::Field(key: "TableClassOverride", converter: ADDB::TableClass)]
    property table_class_override : TableClass | Nil

    def initialize(
      @region_name : String,
      @kms_master_key_id : String | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil,
      @on_demand_throughput_override : OnDemandThroughputOverride | Nil = nil,
      @global_secondary_indexes : Array(ReplicaGlobalSecondaryIndex) | Nil = nil,
      @table_class_override : TableClass | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @provisioned_throughput_override
        value.validate!
      end

      if value = @on_demand_throughput_override
        value.validate!
      end

      if value = @global_secondary_indexes
        raise Core::ValidationError.new("GlobalSecondaryIndexes must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@region_name, @kms_master_key_id, @provisioned_throughput_override, @on_demand_throughput_override, @global_secondary_indexes, @table_class_override)
  end
end
