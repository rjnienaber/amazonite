private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @capacity_providers
        raise Core::ValidationError.new("CapacityProviders must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("CapacityProviders must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@capacity_providers, @next_marker)
  end
end
