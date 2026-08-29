module Amazonite::ApiGatewayV1
  # The collection of VPC links under the caller's account in a region.
  class VpcLinks
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(VpcLink) | Nil

    # The current pagination position in the paged result set.
    @[JSON::Field(key: "position", ignore: true)]
    property position : String | Nil

    def initialize(
      @items : Array(VpcLink) | Nil = nil,
      @position : String | Nil = nil,
    )
    end
  end
end
