private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class GetDeliveryDestinationPolicyRequest
    include JSON::Serializable

    # The name of the delivery destination that you want to retrieve the policy of.
    @[JSON::Field(key: "deliveryDestinationName")]
    property delivery_destination_name : String

    def initialize(
      @delivery_destination_name : String,
    )
    end

    def validate! : Nil
      if value = @delivery_destination_name
        raise Core::ValidationError.new("deliveryDestinationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("deliveryDestinationName length must be <= 60") if value.size > 60
        raise Core::ValidationError.new("deliveryDestinationName does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]*$"))
      end
    end

    def_equals_and_hash(@delivery_destination_name)
  end
end
