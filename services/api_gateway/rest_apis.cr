private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Contains references to your APIs and links that guide you in how to interact with your
  # collection. A collection offers a paginated view of your APIs.
  class RestApis
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(RestApi) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(RestApi) | Nil = nil,
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
