private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class GetDeliveryDestinationResponse
    include JSON::Serializable

    # A structure containing information about the delivery destination.
    @[JSON::Field(key: "deliveryDestination")]
    property delivery_destination : DeliveryDestination | Nil

    def initialize(
      @delivery_destination : DeliveryDestination | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @delivery_destination
        value.validate!
      end
    end

    def_equals_and_hash(@delivery_destination)
  end
end
