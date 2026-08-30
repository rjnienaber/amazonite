module Amazonite::CloudWatchLogsV1
  class GetDeliverySourceResponse
    include JSON::Serializable

    # A structure containing information about the delivery source.
    @[JSON::Field(key: "deliverySource")]
    property delivery_source : DeliverySource | Nil

    def initialize(
      @delivery_source : DeliverySource | Nil = nil,
    )
    end
  end
end
