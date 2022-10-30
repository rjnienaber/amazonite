private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class SourceTableDetails
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "TableId")]
    property table_id : String

    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    @[JSON::Field(key: "TableSizeBytes")]
    property table_size_bytes : Int64 | Nil

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement)

    @[JSON::Field(key: "TableCreationDateTime", converter: Core::AWSEpochConverter)]
    property table_creation_date_time : Time

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput

    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    def initialize(
      @table_name : String,
      @table_id : String,
      @key_schema : Array(KeySchemaElement),
      @table_creation_date_time : Time,
      @provisioned_throughput : ProvisionedThroughput,
      @table_arn : String | Nil = nil,
      @table_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @billing_mode : BillingMode | Nil = nil
    )
    end
  end
end
