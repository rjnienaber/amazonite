module Amazonite::DynamoDBv2
  class PutRequest
    include JSON::Serializable

    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue)

    def initialize(
      @item : Hash(String, AttributeValue)
    )
    end
  end
end