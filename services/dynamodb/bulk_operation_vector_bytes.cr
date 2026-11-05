private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains the bulk put vector bytes used by a vector index during a bulk operation.
  class BulkOperationVectorBytes
    include JSON::Serializable

    # The number of bulk put vector bytes used on the vector index.
    @[JSON::Field(key: "BulkPutVectorBytes")]
    property bulk_put_vector_bytes : Int64 | Nil

    def initialize(
      @bulk_put_vector_bytes : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @bulk_put_vector_bytes
        raise Core::ValidationError.new("BulkPutVectorBytes value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@bulk_put_vector_bytes)
  end
end
