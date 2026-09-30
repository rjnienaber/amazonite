private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class GetDeliverySourceResponse
    include JSON::Serializable

    # A structure containing information about the delivery source.
    @[JSON::Field(key: "deliverySource")]
    property delivery_source : DeliverySource | Nil

    def initialize(
      @delivery_source : DeliverySource | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @delivery_source
        value.validate!
      end
    end

    def_equals_and_hash(@delivery_source)
  end
end
