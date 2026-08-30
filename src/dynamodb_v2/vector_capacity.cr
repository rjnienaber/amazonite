module Amazonite::DynamoDBV2
  # The consumed capacity for vector index operations, including vector search request bytes and
  # vector write request bytes.
  class VectorCapacity
    include JSON::Serializable

    # The number of vector search request bytes consumed by a `SearchVectors` operation.
    @[JSON::Field(key: "VectorSearchRequestBytes")]
    property vector_search_request_bytes : Float64 | Nil

    # The number of vector write request bytes consumed when writing to a vector index. Reported for
    # write operations that modify attributes indexed by a vector index.
    @[JSON::Field(key: "VectorWriteRequestBytes")]
    property vector_write_request_bytes : Float64 | Nil

    def initialize(
      @vector_search_request_bytes : Float64 | Nil = nil,
      @vector_write_request_bytes : Float64 | Nil = nil,
    )
    end

    def_equals_and_hash(@vector_search_request_bytes, @vector_write_request_bytes)
  end
end
