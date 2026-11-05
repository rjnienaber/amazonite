private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains the bulk put bytes used during a bulk operation.
  class BulkOperationBytes
    include JSON::Serializable

    # The number of bulk put bytes.
    @[JSON::Field(key: "BulkPutBytes")]
    property bulk_put_bytes : Int64 | Nil

    def initialize(
      @bulk_put_bytes : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @bulk_put_bytes
        raise Core::ValidationError.new("BulkPutBytes value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@bulk_put_bytes)
  end
end
