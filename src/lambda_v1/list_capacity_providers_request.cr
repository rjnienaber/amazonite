private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class ListCapacityProvidersRequest
    include JSON::Serializable

    @[JSON::Field(key: "State", converter: AL::CapacityProviderState, ignore: true)]
    property state : CapacityProviderState | Nil

    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @state : CapacityProviderState | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end
  end
end
