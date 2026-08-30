module Amazonite::DynamoDBV2
  # Represents an operation to perform - either `DeleteItem` or `PutItem`. You can only request one
  # of these operations, not both, in a single `WriteRequest`. If you do need to perform both of
  # these operations, you need to provide two separate `WriteRequest` objects.
  class WriteRequest
    include JSON::Serializable

    # A request to perform a `PutItem` operation.
    @[JSON::Field(key: "PutRequest")]
    property put_request : PutRequest | Nil

    # A request to perform a `DeleteItem` operation.
    @[JSON::Field(key: "DeleteRequest")]
    property delete_request : DeleteRequest | Nil

    def initialize(
      @put_request : PutRequest | Nil = nil,
      @delete_request : DeleteRequest | Nil = nil,
    )
    end

    def_equals_and_hash(@put_request, @delete_request)
  end
end
