module Amazonite::CloudWatchLogsV1
  class DescribeDestinationsRequest
    include JSON::Serializable

    # The prefix to match. If you don't specify a value, no prefix filter is applied.
    @[JSON::Field(key: "DestinationNamePrefix")]
    property destination_name_prefix : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of items returned. If you don't specify a value, the default maximum value of
    # 50 items is used.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @destination_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@destination_name_prefix, @next_token, @limit)
  end
end
