module Amazonite::LambdaV1
  class ListCapacityProvidersResponse
    include JSON::Serializable

    # A list of capacity providers in your account.
    @[JSON::Field(key: "CapacityProviders")]
    property capacity_providers : Array(CapacityProvider) = [] of CapacityProvider

    # The pagination token that's included if more results are available.
    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @capacity_providers : Array(CapacityProvider),
      @next_marker : String | Nil = nil,
    )
    end
  end
end
