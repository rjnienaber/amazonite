private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # The capacity units consumed by an operation. The data returned includes the total provisioned
  # throughput consumed, along with statistics for the table and any indexes involved in the
  # operation. `ConsumedCapacity` is only returned if the request asked for it. For more
  # information, see [Provisioned capacity
  # mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/provisioned-capacity-mode.html)
  # in the *Amazon DynamoDB Developer Guide*.
  class ConsumedCapacity
    include JSON::Serializable

    # The name of the table that was affected by the operation. If you had specified the Amazon
    # Resource Name (ARN) of a table in the input, you'll see the table ARN in the response.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The total number of capacity units consumed by the operation.
    @[JSON::Field(key: "CapacityUnits")]
    property capacity_units : Float64 | Nil

    # The total number of read capacity units consumed by the operation.
    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Float64 | Nil

    # The total number of write capacity units consumed by the operation.
    @[JSON::Field(key: "WriteCapacityUnits")]
    property write_capacity_units : Float64 | Nil

    # The amount of throughput consumed on the table affected by the operation.
    @[JSON::Field(key: "Table")]
    property table : Capacity | Nil

    # The amount of throughput consumed on each local index affected by the operation.
    @[JSON::Field(key: "LocalSecondaryIndexes")]
    property local_secondary_indexes : Hash(String, Capacity) | Nil

    # The amount of throughput consumed on each global index affected by the operation.
    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Hash(String, Capacity) | Nil

    # The amount of throughput consumed on each vector index affected by the operation. Each entry
    # contains `VectorWriteRequestBytes` (for write operations) or `VectorSearchRequestBytes` (for
    # search operations).
    @[JSON::Field(key: "VectorIndexes")]
    property vector_indexes : Hash(String, VectorCapacity) | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @capacity_units : Float64 | Nil = nil,
      @read_capacity_units : Float64 | Nil = nil,
      @write_capacity_units : Float64 | Nil = nil,
      @table : Capacity | Nil = nil,
      @local_secondary_indexes : Hash(String, Capacity) | Nil = nil,
      @global_secondary_indexes : Hash(String, Capacity) | Nil = nil,
      @vector_indexes : Hash(String, VectorCapacity) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @table
        value.validate!
      end

      if value = @local_secondary_indexes
        value.each_value(&.validate!)
      end

      if value = @global_secondary_indexes
        value.each_value(&.validate!)
      end

      if value = @vector_indexes
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@table_name, @capacity_units, @read_capacity_units, @write_capacity_units, @table, @local_secondary_indexes, @global_secondary_indexes, @vector_indexes)
  end
end
