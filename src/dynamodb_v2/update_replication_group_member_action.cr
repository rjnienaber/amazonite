private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class UpdateReplicationGroupMemberAction
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String

    @[JSON::Field(key: "KMSMasterKeyId")]
    property kms_master_key_id : String | Nil

    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(ReplicaGlobalSecondaryIndex) | Nil

    @[JSON::Field(key: "TableClassOverride", converter: ADDB::TableClass)]
    property table_class_override : TableClass | Nil

    def initialize(
      @region_name : String,
      @kms_master_key_id : String | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil,
      @global_secondary_indexes : Array(ReplicaGlobalSecondaryIndex) | Nil = nil,
      @table_class_override : TableClass | Nil = nil
    )
    end
  end
end
