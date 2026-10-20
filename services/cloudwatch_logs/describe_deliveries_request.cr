private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DescribeDeliveriesRequest
    include JSON::Serializable

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # Optionally specify the maximum number of deliveries to return in the response.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # An array of delivery source names that filters the results to deliveries associated with any
    # specified delivery source.
    @[JSON::Field(key: "deliverySourceNames")]
    property delivery_source_names : Array(String) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @delivery_source_names : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end

      if value = @delivery_source_names
        raise Core::ValidationError.new("deliverySourceNames must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("deliverySourceNames must have at most 20 item(s)") if value.size > 20
      end
    end

    def_equals_and_hash(@next_token, @limit, @delivery_source_names)
  end
end
