module Amazonite::LambdaV1
  class CreateCapacityProviderResponse
    include JSON::Serializable

    @[JSON::Field(key: "CapacityProvider")]
    property capacity_provider : CapacityProvider

    def initialize(
      @capacity_provider : CapacityProvider,
    )
    end
  end
end
