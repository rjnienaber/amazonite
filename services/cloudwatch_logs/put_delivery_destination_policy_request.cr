private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class PutDeliveryDestinationPolicyRequest
    include JSON::Serializable

    # The name of the delivery destination to assign this policy to.
    @[JSON::Field(key: "deliveryDestinationName")]
    property delivery_destination_name : String

    # The contents of the policy.
    @[JSON::Field(key: "deliveryDestinationPolicy")]
    property delivery_destination_policy : String

    def initialize(
      @delivery_destination_name : String,
      @delivery_destination_policy : String,
    )
    end

    def validate! : Nil
      if value = @delivery_destination_name
        raise Core::ValidationError.new("deliveryDestinationName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("deliveryDestinationName length must be <= 60") if value.size > 60
        raise Core::ValidationError.new("deliveryDestinationName does not match the required pattern") unless value.matches?(Regex.new("^[\\w-]*$"))
      end

      if value = @delivery_destination_policy
        raise Core::ValidationError.new("deliveryDestinationPolicy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("deliveryDestinationPolicy length must be <= 51200") if value.size > 51200
      end
    end

    def_equals_and_hash(@delivery_destination_name, @delivery_destination_policy)
  end
end
