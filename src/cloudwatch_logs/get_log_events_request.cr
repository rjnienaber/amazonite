private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class GetLogEventsRequest
    include JSON::Serializable

    # The name of the log group.
    #
    # You must include either `logGroupIdentifier` or `logGroupName`, but not both.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # Specify either the name or ARN of the log group to view events from. If the log group is in a
    # source account and you are using a monitoring account, you must use the log group ARN.
    #
    # You must include either `logGroupIdentifier` or `logGroupName`, but not both.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The name of the log stream.
    @[JSON::Field(key: "logStreamName")]
    property log_stream_name : String

    # The start of the time range, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00
    # UTC`. Events with a timestamp equal to this time or later than this time are included. Events
    # with a timestamp earlier than this time are not included.
    #
    # Set `startTime` explicitly to reduce the chances of empty pages in the response.
    @[JSON::Field(key: "startTime")]
    property start_time : Int64 | Nil

    # The end of the time range, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00
    # UTC`. Events with a timestamp equal to or later than this time are not included.
    @[JSON::Field(key: "endTime")]
    property end_time : Int64 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of log events returned. If you don't specify a limit, the default is as many
    # log events as can fit in a response size of 1 MB (up to 10,000 log events).
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # If the value is true, the earliest log events are returned first. If the value is false, the
    # latest log events are returned first. The default value is false.
    #
    # If you are using a previous `nextForwardToken` value as the `nextToken` in this operation, you
    # must specify `true` for `startFromHead`.
    @[JSON::Field(key: "startFromHead")]
    property start_from_head : Bool | Nil

    # Specify `true` to display the log event fields with all sensitive data unmasked and visible. The
    # default is `false`.
    #
    # To use this operation with this parameter, you must be signed into an account with the
    # `logs:Unmask` permission.
    @[JSON::Field(key: "unmask")]
    property unmask : Bool | Nil

    def initialize(
      @log_stream_name : String,
      @log_group_name : String | Nil = nil,
      @log_group_identifier : String | Nil = nil,
      @start_time : Int64 | Nil = nil,
      @end_time : Int64 | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @start_from_head : Bool | Nil = nil,
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

      if value = @log_stream_name
        raise Core::ValidationError.new("logStreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logStreamName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logStreamName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @start_time
        raise Core::ValidationError.new("startTime value must be >= 0") if value < 0
      end

      if value = @end_time
        raise Core::ValidationError.new("endTime value must be >= 0") if value < 0
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 10000") if value > 10000
      end
    end

    def_equals_and_hash(@log_group_name, @log_group_identifier, @log_stream_name, @start_time, @end_time, @next_token, @limit, @start_from_head, @unmask)
  end
end
