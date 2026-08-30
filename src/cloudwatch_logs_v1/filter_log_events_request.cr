private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class FilterLogEventsRequest
    include JSON::Serializable

    # The name of the log group to search.
    #
    # You must include either `logGroupIdentifier` or `logGroupName`, but not both.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # Specify either the name or ARN of the log group to view log events from. If the log group is in
    # a source account and you are using a monitoring account, you must use the log group ARN.
    #
    # You must include either `logGroupIdentifier` or `logGroupName`, but not both.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # Filters the results to only logs from the log streams in this list.
    #
    # If you specify a value for both `logStreamNames` and `logStreamNamePrefix`, the action returns
    # an `InvalidParameterException` error.
    @[JSON::Field(key: "logStreamNames")]
    property log_stream_names : Array(String) | Nil

    # Filters the results to include only events from log streams that have names starting with this
    # prefix.
    #
    # If you specify a value for both `logStreamNamePrefix` and `logStreamNames`, the action returns
    # an `InvalidParameterException` error.
    @[JSON::Field(key: "logStreamNamePrefix")]
    property log_stream_name_prefix : String | Nil

    # The start of the time range, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00
    # UTC`. Events with a timestamp before this time are not returned.
    #
    # Set `startTime` explicitly to reduce the chances of empty pages in the response.
    @[JSON::Field(key: "startTime")]
    property start_time : Int64 | Nil

    # The end of the time range, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00
    # UTC`. Events with a timestamp later than this time are not returned.
    @[JSON::Field(key: "endTime")]
    property end_time : Int64 | Nil

    # The filter pattern to use. For more information, see [Filter and Pattern
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html).
    #
    # If not provided, all the events are matched.
    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String | Nil

    # The token for the next set of events to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of events to return. The default is 10,000 events.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # If the value is true, the earliest log events are returned first. If the value is false, the
    # latest log events are returned first. The default value is true.
    #
    # The `startFromHead` parameter sets the sort direction on the first request. On subsequent
    # requests, the `nextToken` determines the sort direction. To continue paginating in the same
    # direction, provide the returned `nextToken`. If you provide both `nextToken` and
    # `startFromHead`, the direction of the `nextToken` is used.
    #
    # Setting `startFromHead` to `false` is supported only when `startTime` is on or after `Jan 1,
    # 2024 00:00:00 UTC`. A request with `startFromHead` set to `false` and a `startTime` before this
    # date returns an `InvalidParameterException`.
    @[JSON::Field(key: "startFromHead")]
    property start_from_head : Bool | Nil

    # If the value is true, the operation attempts to provide responses that contain events from
    # multiple log streams within the log group, interleaved in a single response. If the value is
    # false, all the matched log events in the first log stream are searched first, then those in the
    # next log stream, and so on.
    #
    # **Important** As of June 17, 2019, this parameter is ignored and the value is assumed to be
    # true. The response from this operation always interleaves events from multiple log streams
    # within a log group.
    @[JSON::Field(key: "interleaved")]
    property interleaved : Bool | Nil

    # Specify `true` to display the log event fields with all sensitive data unmasked and visible. The
    # default is `false`.
    #
    # To use this operation with this parameter, you must be signed into an account with the
    # `logs:Unmask` permission.
    @[JSON::Field(key: "unmask")]
    property unmask : Bool | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @log_group_identifier : String | Nil = nil,
      @log_stream_names : Array(String) | Nil = nil,
      @log_stream_name_prefix : String | Nil = nil,
      @start_time : Int64 | Nil = nil,
      @end_time : Int64 | Nil = nil,
      @filter_pattern : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @start_from_head : Bool | Nil = nil,
      @interleaved : Bool | Nil = nil,
      @unmask : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @log_stream_names
        raise Core::ValidationError.new("logStreamNames must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logStreamNames must have at most 100 item(s)") if value.size > 100
      end

      if value = @log_stream_name_prefix
        raise Core::ValidationError.new("logStreamNamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logStreamNamePrefix length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logStreamNamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @start_time
        raise Core::ValidationError.new("startTime value must be >= 0") if value < 0
      end

      if value = @end_time
        raise Core::ValidationError.new("endTime value must be >= 0") if value < 0
      end

      if value = @filter_pattern
        raise Core::ValidationError.new("filterPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("filterPattern length must be <= 1024") if value.size > 1024
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 10000") if value > 10000
      end
    end

    def_equals_and_hash(@log_group_name, @log_group_identifier, @log_stream_names, @log_stream_name_prefix, @start_time, @end_time, @filter_pattern, @next_token, @limit, @start_from_head, @interleaved, @unmask)
  end
end
