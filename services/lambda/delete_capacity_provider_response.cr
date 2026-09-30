private alias Core = Amazonite::Core

module Amazonite::Lambda
  class DeleteCapacityProviderResponse
    include JSON::Serializable

    # Information about the deleted capacity provider.
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
