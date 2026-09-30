private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class CreateDeliveryResponse
    include JSON::Serializable

    # A structure that contains information about the delivery that you just created.
    @[JSON::Field(key: "delivery")]
    property delivery : Delivery | Nil

    def initialize(
      @delivery : Delivery | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @delivery
        value.validate!
      end
    end

    def_equals_and_hash(@delivery)
  end
end
