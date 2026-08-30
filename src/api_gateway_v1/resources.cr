module Amazonite::ApiGatewayV1
  # Represents a collection of Resource resources.
  class Resources
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(Resource) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(Resource) | Nil = nil,
      @position : String | Nil = nil,
    )
    end

    def_equals_and_hash(@items, @position)
  end
end
