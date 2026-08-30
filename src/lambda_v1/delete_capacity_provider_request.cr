module Amazonite::LambdaV1
  class DeleteCapacityProviderRequest
    include JSON::Serializable

    # The name of the capacity provider to delete.
    @[JSON::Field(key: "CapacityProviderName", ignore: true)]
    property capacity_provider_name : String = ""

    def initialize(
      @capacity_provider_name : String,
    )
    end

    def_equals_and_hash(@capacity_provider_name)
  end
end
