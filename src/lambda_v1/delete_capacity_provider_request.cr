module Amazonite::LambdaV1
  class DeleteCapacityProviderRequest
    include JSON::Serializable

    @[JSON::Field(key: "CapacityProviderName", ignore: true)]
    property capacity_provider_name : String = ""

    def initialize(
      @capacity_provider_name : String,
    )
    end
  end
end
