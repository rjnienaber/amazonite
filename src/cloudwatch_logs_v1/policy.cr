private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @delivery_destination_policy
        raise Core::ValidationError.new("deliveryDestinationPolicy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("deliveryDestinationPolicy length must be <= 51200") if value.size > 51200
      end
    end

    def_equals_and_hash(@delivery_destination_policy)
  end
end
