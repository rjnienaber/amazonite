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
  end
end
