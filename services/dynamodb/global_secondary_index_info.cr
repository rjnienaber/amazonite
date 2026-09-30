private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents the properties of a global secondary index for the table when the backup was created.
  class GlobalSecondaryIndexInfo
    include JSON::Serializable

    # The name of the global secondary index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # The complete key schema for a global secondary index, which consists of one or more pairs of
    # attribute names and key types:
    #
    # - `HASH` - partition key
    #
    # - `RANGE` - sort key
    #
    # The partition key of an item is also known as its *hash attribute*. The term "hash attribute"
    # derives from DynamoDB's usage of an internal hash function to evenly distribute data items
    # across partitions, based on their partition key values.
    #
    # The sort key of an item is also known as its *range attribute*. The term "range attribute"
    # derives from the way DynamoDB stores items with the same partition key physically close
    # together, in sorted order by the sort key value.
    @[JSON::Field(key: "KeySchema")]
    property key_schema : Array(KeySchemaElement) | Nil

    # Represents attributes that are copied (projected) from the table into the global secondary
    # index. These are in addition to the primary key attributes and index key attributes, which are
    # automatically projected.
    @[JSON::Field(key: "Projection")]
    property projection : Projection | Nil

    # Represents the provisioned throughput settings for the specified global secondary index.
    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @key_schema
        raise Core::ValidationError.new("KeySchema must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @projection
        value.validate!
      end

      if value = @provisioned_throughput
        value.validate!
      end

      if value = @on_demand_throughput
        value.validate!
      end
    end

    def_equals_and_hash(@index_name, @key_schema, @projection, @provisioned_throughput, @on_demand_throughput)
  end
end
