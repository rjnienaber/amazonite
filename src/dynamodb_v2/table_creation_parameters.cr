private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # The parameters for the table created as part of the import operation.
  class TableCreationParameters
    include JSON::Serializable

    # The name of the table created as part of the import operation.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The attributes of the table created as part of the import operation.
    @[JSON::Field(key: "AttributeDefinitions")]
    property attribute_definitions : Array(AttributeDefinition) = [] of AttributeDefinition

    # The primary key and option sort key of the table created as part of the import operation.
    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) = [] of KeySchemaElement

    # The billing mode for provisioning the table created as part of the import operation.
    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    @[JSON::Field(key: "SSESpecification")]
    property sse_specification : SSESpecification | Nil

    # The Global Secondary Indexes (GSI) of the table to be created as part of the import operation.
    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(GlobalSecondaryIndex) | Nil

    # The vector indexes of the table to be created as part of the import operation.
    @[JSON::Field(key: "VectorIndexes")]
    property vector_indexes : Array(VectorIndex) | Nil

    def initialize(
      @table_name : String,
      @attribute_definitions : Array(AttributeDefinition),
      @key_schema : Array(KeySchemaElement),
      @billing_mode : BillingMode | Nil = nil,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
      @sse_specification : SSESpecification | Nil = nil,
      @global_secondary_indexes : Array(GlobalSecondaryIndex) | Nil = nil,
      @vector_indexes : Array(VectorIndex) | Nil = nil,
    )
    end

    def_equals_and_hash(@table_name, @attribute_definitions, @key_schema, @billing_mode, @provisioned_throughput, @on_demand_throughput, @sse_specification, @global_secondary_indexes, @vector_indexes)
  end
end
