private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains the bytes used during a bulk operation, including a breakdown for the table and its
  # indexes.
  class BulkOperationUsage
    include JSON::Serializable

    # The name or ARN of the table associated with the reported usage.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The total number of bulk put bytes used by the operation. This value excludes bulk put vector
    # bytes.
    @[JSON::Field(key: "BulkPutBytes")]
    property bulk_put_bytes : Int64 | Nil

    # The number of bulk put bytes for the table, excluding its indexes.
    @[JSON::Field(key: "Table")]
    property table : BulkOperationBytes | Nil

    # The bulk put bytes used on each local secondary index affected by the operation, keyed by index
    # name.
    @[JSON::Field(key: "LocalSecondaryIndexes")]
    property local_secondary_indexes : Hash(String, BulkOperationBytes) | Nil

    # The bulk put bytes used on each global secondary index affected by the operation, keyed by index
    # name.
    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Hash(String, BulkOperationBytes) | Nil

    # The bulk put vector bytes used on each vector index affected by the operation, keyed by index
    # name.
    @[JSON::Field(key: "VectorIndexes")]
    property vector_indexes : Hash(String, BulkOperationVectorBytes) | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @bulk_put_bytes : Int64 | Nil = nil,
      @table : BulkOperationBytes | Nil = nil,
      @local_secondary_indexes : Hash(String, BulkOperationBytes) | Nil = nil,
      @global_secondary_indexes : Hash(String, BulkOperationBytes) | Nil = nil,
      @vector_indexes : Hash(String, BulkOperationVectorBytes) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @bulk_put_bytes
        raise Core::ValidationError.new("BulkPutBytes value must be >= 0") if value < 0
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

    def_equals_and_hash(@table_name, @bulk_put_bytes, @table, @local_secondary_indexes, @global_secondary_indexes, @vector_indexes)
  end
end
