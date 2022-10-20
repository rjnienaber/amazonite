private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class TableCreationParameters
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "AttributeDefinitions")]
    property attribute_definitions : Array(AttributeDefinition)

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement)

    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    @[JSON::Field(key: "SSESpecification")]
    property ssespecification : SSESpecification | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(GlobalSecondaryIndex) | Nil

    def initialize(
      @table_name : String,
      @attribute_definitions : Array(AttributeDefinition),
      @key_schema : Array(KeySchemaElement),
      @billing_mode : BillingMode | Nil = nil,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @ssespecification : SSESpecification | Nil = nil,
      @global_secondary_indexes : Array(GlobalSecondaryIndex) | Nil = nil
    )
    end
  end
end