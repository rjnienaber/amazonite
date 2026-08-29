module Amazonite::LambdaV1
  class ListCapacityProvidersResponse
    include JSON::Serializable

    @[JSON::Field(key: "CapacityProviders")]
    property capacity_providers : Array(CapacityProvider) = [] of CapacityProvider

    @[JSON::Field(key: "NextMarker")]
    property next_marker : String | Nil

    def initialize(
      @capacity_providers : Array(CapacityProvider),
      @next_marker : String | Nil = nil,
    )
    end
  end
end
