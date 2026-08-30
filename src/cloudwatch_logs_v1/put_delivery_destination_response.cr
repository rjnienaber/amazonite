module Amazonite::CloudWatchLogsV1
  class PutDeliveryDestinationResponse
    include JSON::Serializable

    # A structure containing information about the delivery destination that you just created or
    # updated.
    @[JSON::Field(key: "deliveryDestination")]
    property delivery_destination : DeliveryDestination | Nil

    def initialize(
      @delivery_destination : DeliveryDestination | Nil = nil,
    )
    end
  end
end
