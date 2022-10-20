private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class CreateTableInput
    include JSON::Serializable

    @[JSON::Field(key: "AttributeDefinitions")]
    property attribute_definitions : Array(AttributeDefinition)

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement)

    @[JSON::Field(key: "LocalSecondaryIndexes")]
    property local_secondary_indexes : Array(LocalSecondaryIndex) | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Array(GlobalSecondaryIndex) | Nil

    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    @[JSON::Field(key: "StreamSpecification")]
    property stream_specification : StreamSpecification | Nil

    @[JSON::Field(key: "SSESpecification")]
    property ssespecification : SSESpecification | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "TableClass", converter: ADDB::TableClass)]
    property table_class : TableClass | Nil

    def initialize(
      @attribute_definitions : Array(AttributeDefinition),
      @table_name : String,
      @key_schema : Array(KeySchemaElement),
      @local_secondary_indexes : Array(LocalSecondaryIndex) | Nil = nil,
      @global_secondary_indexes : Array(GlobalSecondaryIndex) | Nil = nil,
      @billing_mode : BillingMode | Nil = nil,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @stream_specification : StreamSpecification | Nil = nil,
      @ssespecification : SSESpecification | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @table_class : TableClass | Nil = nil
    )
    end
  end
end
