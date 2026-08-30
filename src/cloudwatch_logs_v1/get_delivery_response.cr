module Amazonite::CloudWatchLogsV1
  class GetDeliveryResponse
    include JSON::Serializable

    # A structure that contains information about the delivery.
    @[JSON::Field(key: "delivery")]
    property delivery : Delivery | Nil

    def initialize(
      @delivery : Delivery | Nil = nil,
    )
    end
  end
end
