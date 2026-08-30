private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @capacity_provider
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_provider)
  end
end
