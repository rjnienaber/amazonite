module Amazonite::CloudWatchLogsV1
  class DeleteDeliveryDestinationPolicyRequest
    include JSON::Serializable

    # The name of the delivery destination that you want to delete the policy for.
    @[JSON::Field(key: "deliveryDestinationName")]
    property delivery_destination_name : String

    def initialize(
      @delivery_destination_name : String,
    )
    end

    def_equals_and_hash(@delivery_destination_name)
  end
end
