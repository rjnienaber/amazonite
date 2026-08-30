private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # The collection of the GatewayResponse instances of a RestApi as a
  # `responseType`-to-GatewayResponse object map of key-value pairs. As such, pagination is not
  # supported for querying this collection.
  class GatewayResponses
    include JSON::Serializable

    # Returns the entire collection, because of no pagination support.
    @[JSON::Field(key: "item")]
    property items : Array(GatewayResponse) | Nil

    # The current pagination position in the paged result set. The GatewayResponse collection does not
    # support pagination and the position does not apply here.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(GatewayResponse) | Nil = nil,
      @position : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @items
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@items, @position)
  end
end
