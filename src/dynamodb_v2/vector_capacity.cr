module Amazonite::DynamoDBV2
  class VectorCapacity
    include JSON::Serializable

    @[JSON::Field(key: "VectorSearchRequestBytes")]
    property vector_search_request_bytes : Float64 | Nil

    @[JSON::Field(key: "VectorWriteRequestBytes")]
    property vector_write_request_bytes : Float64 | Nil

    def initialize(
      @vector_search_request_bytes : Float64 | Nil = nil,
      @vector_write_request_bytes : Float64 | Nil = nil,
    )
    end
  end
end
