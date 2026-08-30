module Amazonite::CloudWatchLogsV1
  class DescribeDeliverySourcesRequest
    include JSON::Serializable

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # Optionally specify the maximum number of delivery sources to return in the response.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@next_token, @limit)
  end
end
