private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class ReplicaDescription
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    @[JSON::Field(key: "ReplicaStatus", converter: ADDB::ReplicaStatus)]
    property replica_status : ReplicaStatus | Nil

    @[JSON::Field(key: "ReplicaStatusDescription")]
    property replica_status_description : String | Nil

    @[JSON::Field(key: "ReplicaStatusPercentProgress")]
    property replica_status_percent_progress : String | Nil

    @[JSON::Field(key: "KMSMasterKeyId")]
    property kmsmaster_key_id : String | Nil

    @[JSON::Field(key: "ProvisionedThroughputOverride")]
    property provisioned_throughput_override : ProvisionedThroughputOverride | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(ReplicaGlobalSecondaryIndexDescription) | Nil

    @[JSON::Field(key: "ReplicaInaccessibleDateTime", converter: AC::AWSEpochConverter)]
    property replica_inaccessible_date_time : Time | Nil

    @[JSON::Field(key: "ReplicaTableClassSummary")]
    property replica_table_class_summary : TableClassSummary | Nil

    def initialize(
      @region_name : String | Nil = nil,
      @replica_status : ReplicaStatus | Nil = nil,
      @replica_status_description : String | Nil = nil,
      @replica_status_percent_progress : String | Nil = nil,
      @kmsmaster_key_id : String | Nil = nil,
      @provisioned_throughput_override : ProvisionedThroughputOverride | Nil = nil,
      @global_secondary_indexes : Array(ReplicaGlobalSecondaryIndexDescription) | Nil = nil,
      @replica_inaccessible_date_time : Time | Nil = nil,
      @replica_table_class_summary : TableClassSummary | Nil = nil
    )
    end
  end
end
