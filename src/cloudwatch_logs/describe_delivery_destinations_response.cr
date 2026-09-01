private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeDeliveryDestinationsResponse
    include JSON::Serializable

    # An array of structures. Each structure contains information about one delivery destination in
    # the account.
    @[JSON::Field(key: "deliveryDestinations")]
    property delivery_destinations : Array(DeliveryDestination) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @delivery_destinations : Array(DeliveryDestination) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @delivery_destinations
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@delivery_destinations, @next_token)
  end
end
