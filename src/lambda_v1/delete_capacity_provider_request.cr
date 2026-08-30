private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @capacity_provider_name
        raise Core::ValidationError.new("CapacityProviderName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CapacityProviderName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("CapacityProviderName does not match the required pattern") unless value.matches?(Regex.new("^(arn:aws[a-zA-Z-]*:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:capacity-provider:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+$"))
      end
    end

    def_equals_and_hash(@capacity_provider_name)
  end
end
