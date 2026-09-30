private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class StartLiveTailRequest
    include JSON::Serializable

    # An array where each item in the array is a log group to include in the Live Tail session.
    #
    # Specify each log group by its ARN.
    #
    # If you specify an ARN, the ARN can't end with an asterisk (*).
    #
    # You can include up to 10 log groups.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) = [] of String

    # If you specify this parameter, then only log events in the log streams that you specify here are
    # included in the Live Tail session.
    #
    # If you specify this field, you can't also specify the `logStreamNamePrefixes` field.
    #
    # You can specify this parameter only if you specify only one log group in `logGroupIdentifiers`.
    @[JSON::Field(key: "logStreamNames")]
    property log_stream_names : Array(String) | Nil

    # If you specify this parameter, then only log events in the log streams that have names that
    # start with the prefixes that you specify here are included in the Live Tail session.
    #
    # If you specify this field, you can't also specify the `logStreamNames` field.
    #
    # You can specify this parameter only if you specify only one log group in `logGroupIdentifiers`.
    @[JSON::Field(key: "logStreamNamePrefixes")]
    property log_stream_name_prefixes : Array(String) | Nil

    # An optional pattern to use to filter the results to include only log events that match the
    # pattern. For example, a filter pattern of `error 404` causes only log events that include both
    # `error` and `404` to be included in the Live Tail stream.
    #
    # Regular expression filter patterns are supported.
    #
    # For more information about filter pattern syntax, see [Filter and Pattern
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html).
    @[JSON::Field(key: "logEventFilterPattern")]
    property log_event_filter_pattern : String | Nil

    def initialize(
      @log_group_identifiers : Array(String),
      @log_stream_names : Array(String) | Nil = nil,
      @log_stream_name_prefixes : Array(String) | Nil = nil,
      @log_event_filter_pattern : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_identifiers
        raise Core::ValidationError.new("logGroupIdentifiers must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifiers must have at most 10 item(s)") if value.size > 10
      end

      if value = @log_stream_names
        raise Core::ValidationError.new("logStreamNames must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logStreamNames must have at most 100 item(s)") if value.size > 100
      end

      if value = @log_stream_name_prefixes
        raise Core::ValidationError.new("logStreamNamePrefixes must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logStreamNamePrefixes must have at most 100 item(s)") if value.size > 100
      end

      if value = @log_event_filter_pattern
        raise Core::ValidationError.new("logEventFilterPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("logEventFilterPattern length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@log_group_identifiers, @log_stream_names, @log_stream_name_prefixes, @log_event_filter_pattern)
  end
end
