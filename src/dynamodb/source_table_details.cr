private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("TableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("TableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @table_id
        raise Core::ValidationError.new("TableId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end

      if value = @table_arn
        raise Core::ValidationError.new("TableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableArn length must be <= 1024") if value.size > 1024
      end

      if value = @key_schema
        raise Core::ValidationError.new("KeySchema must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @provisioned_throughput
        value.validate!
      end

      if value = @on_demand_throughput
        value.validate!
      end

      if value = @item_count
        raise Core::ValidationError.new("ItemCount value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@table_name, @table_id, @table_arn, @table_size_bytes, @key_schema, @table_creation_date_time, @provisioned_throughput, @on_demand_throughput, @item_count, @billing_mode)
  end
end
