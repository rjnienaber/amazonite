module Amazonite::DynamoDBv2
  class DeleteRequest
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    def initialize(
      @key : Hash(String, AttributeValue)
    )
    end
  end
end
