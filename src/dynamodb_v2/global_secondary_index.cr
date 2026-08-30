module Amazonite::DynamoDBV2
  # Represents the properties of a global secondary index.
  class GlobalSecondaryIndex
    include JSON::Serializable

    # The name of the global secondary index. The name must be unique among all other indexes on this
    # table.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

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
    property key_schema : Array(KeySchemaElement) = [] of KeySchemaElement

    # Represents attributes that are copied (projected) from the table into the global secondary
    # index. These are in addition to the primary key attributes and index key attributes, which are
    # automatically projected.
    @[JSON::Field(key: "Projection")]
    property projection : Projection

    # Represents the provisioned throughput settings for the specified global secondary index. You
    # must use either `OnDemandThroughput` or `ProvisionedThroughput` based on your table's capacity
    # mode.
    #
    # For current minimum and maximum provisioned throughput values, see [Service, Account, and Table
    # Quotas](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html) in the
    # *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughput | Nil

    # The maximum number of read and write units for the specified global secondary index. If you use
    # this parameter, you must specify `MaxReadRequestUnits`, `MaxWriteRequestUnits`, or both. You
    # must use either `OnDemandThroughput` or `ProvisionedThroughput` based on your table's capacity
    # mode.
    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    # Represents the warm throughput value (in read units per second and write units per second) for
    # the specified secondary index. If you use this parameter, you must specify `ReadUnitsPerSecond`,
    # `WriteUnitsPerSecond`, or both.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : WarmThroughput | Nil

    def initialize(
      @index_name : String,
      @key_schema : Array(KeySchemaElement),
      @projection : Projection,
      @provisioned_throughput : ProvisionedThroughput | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
      @warm_throughput : WarmThroughput | Nil = nil,
    )
    end

    def_equals_and_hash(@index_name, @key_schema, @projection, @provisioned_throughput, @on_demand_throughput, @warm_throughput)
  end
end
