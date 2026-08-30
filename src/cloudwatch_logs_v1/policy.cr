module Amazonite::CloudWatchLogsV1
  # A structure that contains information about one delivery destination policy.
  class Policy
    include JSON::Serializable

    # The contents of the delivery destination policy.
    @[JSON::Field(key: "deliveryDestinationPolicy")]
    property delivery_destination_policy : String | Nil

    def initialize(
      @delivery_destination_policy : String | Nil = nil,
    )
    end
  end
end
