module Amazonite::CloudWatchLogsV1
  class DescribeDeliveriesResponse
    include JSON::Serializable

    # An array of structures. Each structure contains information about one delivery in the account.
    @[JSON::Field(key: "deliveries")]
    property deliveries : Array(Delivery) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @deliveries : Array(Delivery) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@deliveries, @next_token)
  end
end
