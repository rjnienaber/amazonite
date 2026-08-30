private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents a replica to be created.
  class CreateReplicationGroupMemberAction
    include JSON::Serializable

    # The Region where the new replica will be created.
    @[JSON::Field(key: "RegionName")]
    property region_name : String

    # The KMS key that should be used for KMS encryption in the new replica. To specify a key, use its
    # key ID, Amazon Resource Name (ARN), alias name, or alias ARN. Note that you should only provide
    # this parameter if the key is different from the default DynamoDB KMS key `alias/aws/dynamodb`.
    @[JSON::Field(key: "KMSMasterKeyId")]
    property kms_master_key_id : String | Nil

    # Replica-specific provisioned throughput. If not specified, uses the source table's provisioned
    # throughput settings.
    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    # The maximum on-demand throughput settings for the specified replica table being created. You can
    # only modify `MaxReadRequestUnits`, because you can't modify `MaxWriteRequestUnits` for
    # individual replica tables.
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
