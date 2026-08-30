module Amazonite::CloudWatchLogsV1
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
  end
end
