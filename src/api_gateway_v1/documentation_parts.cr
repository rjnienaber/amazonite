module Amazonite::ApiGatewayV1
  # The collection of documentation parts of an API.
  class DocumentationParts
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(DocumentationPart) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(DocumentationPart) | Nil = nil,
      @position : String | Nil = nil,
    )
    end

    def_equals_and_hash(@items, @position)
  end
end
