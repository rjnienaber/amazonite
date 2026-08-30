module Amazonite::DynamoDBV2
  # Represents the properties of a local secondary index for the table when the backup was created.
  class LocalSecondaryIndexInfo
    include JSON::Serializable

    # Represents the name of the local secondary index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # The complete key schema for a local secondary index, which consists of one or more pairs of
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

    def initialize(
      @index_name : String | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil,
    )
    end

    def_equals_and_hash(@index_name, @key_schema, @projection)
  end
end
