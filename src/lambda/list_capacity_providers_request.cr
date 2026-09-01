private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  class ListCapacityProvidersRequest
    include JSON::Serializable

    # Filter capacity providers by their current state.
    @[JSON::Field(key: "State", converter: AL::CapacityProviderState, ignore: true)]
    property state : CapacityProviderState | Nil

    # Specify the pagination token that's returned by a previous request to retrieve the next page of
    # results.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # The maximum number of capacity providers to return.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @state : CapacityProviderState | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@state, @marker, @max_items)
  end
end
