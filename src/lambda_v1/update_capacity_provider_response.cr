module Amazonite::LambdaV1
  class UpdateCapacityProviderResponse
    include JSON::Serializable

    # Information about the updated capacity provider.
    @[JSON::Field(key: "CapacityProvider")]
    property capacity_provider : CapacityProvider

    def initialize(
      @capacity_provider : CapacityProvider,
    )
    end

    def_equals_and_hash(@capacity_provider)
  end
end
