module Amazonite::DynamoDBV2
  class SearchResultItem
    include JSON::Serializable

    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "Score")]
    property score : Float64 | Nil

    def initialize(
      @item : Hash(String, AttributeValue) | Nil = nil,
      @score : Float64 | Nil = nil,
    )
    end
  end
end
