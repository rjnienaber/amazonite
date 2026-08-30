private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeDeliverySourcesResponse
    include JSON::Serializable

    # An array of structures. Each structure contains information about one delivery source in the
    # account.
    @[JSON::Field(key: "deliverySources")]
    property delivery_sources : Array(DeliverySource) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @delivery_sources : Array(DeliverySource) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @delivery_sources
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@delivery_sources, @next_token)
  end
end
