module Amazonite::ApiGatewayV1
  # The collection of SdkType instances.
  class SdkTypes
    include JSON::Serializable

    # The current page of elements from this collection.
    @[JSON::Field(key: "item")]
    property items : Array(SdkType) | Nil

    def initialize(
      @items : Array(SdkType) | Nil = nil,
    )
    end

    def_equals_and_hash(@items)
  end
end
