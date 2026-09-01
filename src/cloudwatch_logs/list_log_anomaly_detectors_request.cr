private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @filter_log_group_arn
        raise Core::ValidationError.new("filterLogGroupArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("filterLogGroupArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("filterLogGroupArn does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@filter_log_group_arn, @limit, @next_token)
  end
end
