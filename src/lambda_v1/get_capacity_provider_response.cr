module Amazonite::LambdaV1
  class GetCapacityProviderResponse
    include JSON::Serializable

    # Information about the capacity provider, including its configuration and current state.
    @[JSON::Field(key: "CapacityProvider")]
    property capacity_provider : CapacityProvider

    def initialize(
      @capacity_provider : CapacityProvider,
    )
    end
  end
end
