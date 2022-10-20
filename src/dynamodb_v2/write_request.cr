module Amazonite::DynamoDBv2
  class WriteRequest
    include JSON::Serializable

    @[JSON::Field(key: "PutRequest")]
    property put_request : PutRequest | Nil

    @[JSON::Field(key: "DeleteRequest")]
    property delete_request : DeleteRequest | Nil

    def initialize(
      @put_request : PutRequest | Nil = nil,
      @delete_request : DeleteRequest | Nil = nil
    )
    end
  end
end