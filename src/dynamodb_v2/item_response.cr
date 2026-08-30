private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Details for the requested item.
  class ItemResponse
    include JSON::Serializable

    # Map of attribute data consisting of the data type and attribute value.
    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    def initialize(
      @item : Hash(String, AttributeValue) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @item
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@item)
  end
end
