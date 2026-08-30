module Amazonite::CloudWatchLogsV1
  class CreateDeliveryResponse
    include JSON::Serializable

    # A structure that contains information about the delivery that you just created.
    @[JSON::Field(key: "delivery")]
    property delivery : Delivery | Nil

    def initialize(
      @delivery : Delivery | Nil = nil,
    )
    end

    def_equals_and_hash(@delivery)
  end
end
