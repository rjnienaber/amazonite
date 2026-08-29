private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains the details of the table when the backup was created.
  class SourceTableDetails
    include JSON::Serializable

    # The name of the table for which the backup was created.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # Unique identifier for the table for which the backup was created.
    @[JSON::Field(key: "TableId")]
    property table_id : String

    # ARN of the table for which backup was created.
    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    # Size of the table in bytes. Note that this is an approximate value.
    @[JSON::Field(key: "TableSizeBytes")]
    property table_size_bytes : Int64 | Nil

    # Schema of the table.
    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) = [] of KeySchemaElement

    # Time when the source table was created.
    @[JSON::Field(key: "TableCreationDateTime", converter: Core::AWSEpochConverter)]
    property table_creation_date_time : Time

    # Read IOPs and Write IOPS on the table when the backup was created.
    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput

    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    # Number of items in the table. Note that this is an approximate value.
    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

    # Controls how you are charged for read and write throughput and how you manage capacity. This
    # setting can be changed later.
    #
    # - `PROVISIONED` - Sets the read/write capacity mode to `PROVISIONED`. We recommend using
    # `PROVISIONED` for predictable workloads.
    #
    # - `PAY_PER_REQUEST` - Sets the read/write capacity mode to `PAY_PER_REQUEST`. We recommend using
    # `PAY_PER_REQUEST` for unpredictable workloads.
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
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @billing_mode : BillingMode | Nil = nil,
    )
    end
  end
end
