module Amazonite::ApiGatewayV1
  # Represents a collection of Model resources.
  class Models
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(Model) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(Model) | Nil = nil,
      @position : String | Nil = nil,
    )
    end

    def_equals_and_hash(@items, @position)
  end
end
