module Amazonite::CloudWatchLogsV1
  class DescribeSubscriptionFiltersRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The prefix to match. If you don't specify a value, no prefix filter is applied.
    @[JSON::Field(key: "filterNamePrefix")]
    property filter_name_prefix : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of items returned. If you don't specify a value, the default is up to 50
    # items.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @log_group_name : String,
      @filter_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end
  end
end
