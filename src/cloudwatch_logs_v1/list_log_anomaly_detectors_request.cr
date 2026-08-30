module Amazonite::CloudWatchLogsV1
  class ListLogAnomalyDetectorsRequest
    include JSON::Serializable

    # Use this to optionally filter the results to only include anomaly detectors that are associated
    # with the specified log group.
    @[JSON::Field(key: "filterLogGroupArn")]
    property filter_log_group_arn : String | Nil

    # The maximum number of items to return. If you don't specify a value, the default maximum value
    # of 50 items is used.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @filter_log_group_arn : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@filter_log_group_arn, @limit, @next_token)
  end
end
