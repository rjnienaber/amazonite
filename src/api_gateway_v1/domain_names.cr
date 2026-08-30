module Amazonite::ApiGatewayV1
  # Represents a collection of DomainName resources.
  class DomainNames
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(DomainName) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(DomainName) | Nil = nil,
      @position : String | Nil = nil,
    )
    end
  end
end
