private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class TableDescription
    include JSON::Serializable

    @[JSON::Field(key: "AttributeDefinitions")]
    property attribute_definitions : Array(AttributeDefinition) | Nil

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) | Nil

    @[JSON::Field(key: "TableStatus", converter: ADDB::TableStatus)]
    property table_status : TableStatus | Nil

    @[JSON::Field(key: "CreationDateTime", converter: AC::AWSEpochConverter)]
    property creation_date_time : Time | Nil

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughputDescription | Nil

    @[JSON::Field(key: "TableSizeBytes")]
    property table_size_bytes : Int64 | Nil

    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    @[JSON::Field(key: "TableId")]
    property table_id : String | Nil

    @[JSON::Field(key: "BillingModeSummary")]
    property billing_mode_summary : BillingModeSummary | Nil

    @[JSON::Field(key: "LocalSecondaryIndexes")]
    property local_secondary_indexes : Array(LocalSecondaryIndexDescription) | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(GlobalSecondaryIndexDescription) | Nil

    @[JSON::Field(key: "StreamSpecification")]
    property stream_specification : StreamSpecification | Nil

    @[JSON::Field(key: "LatestStreamLabel")]
    property latest_stream_label : String | Nil

    @[JSON::Field(key: "LatestStreamArn")]
    property latest_stream_arn : String | Nil

    @[JSON::Field(key: "GlobalTableVersion")]
    property global_table_version : String | Nil

    @[JSON::Field(key: "Replicas")]
    property replicas : Array(ReplicaDescription) | Nil

    @[JSON::Field(key: "RestoreSummary")]
    property restore_summary : RestoreSummary | Nil

    @[JSON::Field(key: "SSEDescription")]
    property ssedescription : SSEDescription | Nil

    @[JSON::Field(key: "ArchivalSummary")]
    property archival_summary : ArchivalSummary | Nil

    @[JSON::Field(key: "TableClassSummary")]
    property table_class_summary : TableClassSummary | Nil

    def initialize(
      @attribute_definitions : Array(AttributeDefinition) | Nil = nil,
      @table_name : String | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @table_status : TableStatus | Nil = nil,
      @creation_date_time : Time | Nil = nil,
      @provisioned_throughput : ProvisionedThroughputDescription | Nil = nil,
      @table_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @table_arn : String | Nil = nil,
      @table_id : String | Nil = nil,
      @billing_mode_summary : BillingModeSummary | Nil = nil,
      @local_secondary_indexes : Array(LocalSecondaryIndexDescription) | Nil = nil,
      @global_secondary_indexes : Array(GlobalSecondaryIndexDescription) | Nil = nil,
      @stream_specification : StreamSpecification | Nil = nil,
      @latest_stream_label : String | Nil = nil,
      @latest_stream_arn : String | Nil = nil,
      @global_table_version : String | Nil = nil,
      @replicas : Array(ReplicaDescription) | Nil = nil,
      @restore_summary : RestoreSummary | Nil = nil,
      @ssedescription : SSEDescription | Nil = nil,
      @archival_summary : ArchivalSummary | Nil = nil,
      @table_class_summary : TableClassSummary | Nil = nil
    )
    end
  end
end
