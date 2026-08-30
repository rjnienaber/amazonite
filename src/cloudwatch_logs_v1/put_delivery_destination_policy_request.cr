module Amazonite::CloudWatchLogsV1
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
  end
end
