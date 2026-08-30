module Amazonite::LambdaV1
  class GetCapacityProviderRequest
    include JSON::Serializable

    # The name of the capacity provider to retrieve.
    @[JSON::Field(key: "CapacityProviderName", ignore: true)]
    property capacity_provider_name : String = ""

    def initialize(
      @capacity_provider_name : String,
    )
    end
  end
end
