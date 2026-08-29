module Amazonite::ApiGatewayV1
  # A collection of RequestValidator resources of a given RestApi.
  class RequestValidators
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(RequestValidator) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(RequestValidator) | Nil = nil,
      @position : String | Nil = nil,
    )
    end
  end
end
