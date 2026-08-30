module Amazonite::CloudWatchLogsV1
  class GetDeliveryDestinationPolicyRequest
    include JSON::Serializable

    # The name of the delivery destination that you want to retrieve the policy of.
    @[JSON::Field(key: "deliveryDestinationName")]
    property delivery_destination_name : String

    def initialize(
      @delivery_destination_name : String,
    )
    end
  end
end
