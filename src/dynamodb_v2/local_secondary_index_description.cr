private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the properties of a local secondary index.
  class LocalSecondaryIndexDescription
    include JSON::Serializable

    # Represents the name of the local secondary index.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    # The complete key schema for the local secondary index, consisting of one or more pairs of
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

    def initialize(
      @index_name : String | Nil = nil,
      @key_schema : Array(KeySchemaElement) | Nil = nil,
      @projection : Projection | Nil = nil,
      @index_size_bytes : Int64 | Nil = nil,
      @item_count : Int64 | Nil = nil,
      @index_arn : String | Nil = nil,
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
    end

    def_equals_and_hash(@index_name, @key_schema, @projection, @index_size_bytes, @item_count, @index_arn)
  end
end
