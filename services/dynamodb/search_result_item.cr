private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # A single result from a `SearchVectors` operation.
  class SearchResultItem
    include JSON::Serializable

    # A map of attribute names to `AttributeValue` objects, representing the projected attributes of
    # the item returned by the vector search.
    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    # The similarity score for this item relative to the search vector. The interpretation depends on
    # the distance function configured for the vector index.
    @[JSON::Field(key: "Score")]
    property score : Float64 | Nil

    def initialize(
      @item : Hash(String, AttributeValue) | Nil = nil,
      @score : Float64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @item
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@item, @score)
  end
end
