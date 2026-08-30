private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the properties of a global secondary index.
  class GlobalSecondaryIndexDescription
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

    # The current state of the global secondary index:
    #
    # - `CREATING` - The index is being created.
    #
    # - `UPDATING` - The index is being updated.
    #
    # - `DELETING` - The index is being deleted.
    #
    # - `ACTIVE` - The index is ready for use.
    @[JSON::Field(key: "IndexStatus", converter: ADDB::IndexStatus)]
    property index_status : IndexStatus | Nil

    # Indicates whether the index is currently backfilling. *Backfilling* is the process of reading
    # items from the table and determining whether they can be added to the index. (Not all items will
    # qualify: For example, a partition key cannot have any duplicate values.) If an item can be added
    # to the index, DynamoDB will do so. After all items have been processed, the backfilling
    # operation is complete and `Backfilling` is false.
    #
    # You can delete an index that is being created during the `Backfilling` phase when `IndexStatus`
    # is set to CREATING and `Backfilling` is true. You can't delete the index that is being created
    # when `IndexStatus` is set to CREATING and `Backfilling` is false.
    #
    # For indexes that were created during a `CreateTable` operation, the `Backfilling` attribute does
    # not appear in the `DescribeTable` output.
    @[JSON::Field(key: "Backfilling")]
    property backfilling : Bool | Nil

    # Represents the provisioned throughput settings for the specified global secondary index.
    #
    # For current minimum and maximum provisioned throughput values, see [Service, Account, and Table
    # Quotas](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html) in the
    # *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ProvisionedThroughput")]
    property provisioned_throughput : ProvisionedThroughputDescription | Nil

    # The total size of the specified index, in bytes. DynamoDB updates this value approximately every
    # six hours. Recent changes might not be reflected in this value.
    @[JSON::Field(key: "IndexSizeBytes")]
    property index_size_bytes : Int64 | Nil

    # The number of items in the specified index. DynamoDB updates this value approximately every six
    # hours. Recent changes might not be reflected in this value.
    @[JSON::Field(key: "ItemCount")]
    property item_count : Int64 | Nil

    # The Amazon Resource Name (ARN) that uniquely identifies the index.
    @[JSON::Field(key: "IndexArn")]
    property index_arn : String | Nil

    # The maximum number of read and write units for the specified global secondary index. If you use
    # this parameter, you must specify `MaxReadRequestUnits`, `MaxWriteRequestUnits`, or both.
    @[JSON::Field(key: "OnDemandThroughput")]
    property on_demand_throughput : OnDemandThroughput | Nil

    # Represents the warm throughput value (in read units per second and write units per second) for
    # the specified secondary index.
    @[JSON::Field(key: "WarmThroughput")]
    property warm_throughput : GlobalSecondaryIndexWarmThroughputDescription | Nil

    def initialize(
      @index_name : String | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil,
      @index_status : IndexStatus | Nil = nil,
      @backfilling : Bool | Nil = nil,
      @provisioned_throughput : ProvisionedThroughputDescription | Nil = nil,
      @index_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @index_arn : String | Nil = nil,
      @on_demand_throughput : OnDemandThroughput | Nil = nil,
      @warm_throughput : GlobalSecondaryIndexWarmThroughputDescription | Nil = nil,
    )
    end

    def_equals_and_hash(@index_name, @key_schema, @projection, @index_status, @backfilling, @provisioned_throughput, @index_size_bytes, @item_count, @index_arn, @on_demand_throughput, @warm_throughput)
  end
end
