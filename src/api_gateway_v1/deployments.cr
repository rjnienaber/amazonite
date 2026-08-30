module Amazonite::ApiGatewayV1
  # Represents a collection resource that contains zero or more references to your existing
  # deployments, and links that guide you on how to interact with your collection. The collection
  # offers a paginated view of the contained deployments.
  class Deployments
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(Deployment) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(Deployment) | Nil = nil,
      @position : String | Nil = nil,
    )
    end

    def_equals_and_hash(@items, @position)
  end
end
