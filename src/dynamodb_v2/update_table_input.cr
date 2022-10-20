private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class UpdateTableInput
    include JSON::Serializable

    @[JSON::Field(key: "AttributeDefinitions")]
    property attribute_definitions : Array(AttributeDefinition) | Nil

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "BillingMode", converter: ADDB::BillingMode)]
    property billing_mode : BillingMode | Nil

    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexUpdates")]
    property global_secondary_index_updates : Array(GlobalSecondaryIndexUpdate) | Nil

    @[JSON::Field(key: "StreamSpecification")]
    property stream_specification : StreamSpecification | Nil

    @[JSON::Field(key: "SSESpecification")]
    property ssespecification : SSESpecification | Nil

    @[JSON::Field(key: "ReplicaUpdates")]
    property replica_updates : Array(ReplicationGroupUpdate) | Nil

    @[JSON::Field(key: "TableClass", converter: ADDB::TableClass)]
    property table_class : TableClass | Nil

    def initialize(
      @table_name : String,
      @attribute_definitions : Array(AttributeDefinition) | Nil = nil,
      @billing_mode : BillingMode | Nil = nil,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @global_secondary_index_updates : Array(GlobalSecondaryIndexUpdate) | Nil = nil,
      @stream_specification : StreamSpecification | Nil = nil,
      @ssespecification : SSESpecification | Nil = nil,
      @replica_updates : Array(ReplicationGroupUpdate) | Nil = nil,
      @table_class : TableClass | Nil = nil
    )
    end
  end
end