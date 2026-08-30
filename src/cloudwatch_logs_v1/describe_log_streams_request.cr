private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class DescribeLogStreamsRequest
    include JSON::Serializable

    # The name of the log group.
    #
    # You must include either `logGroupIdentifier` or `logGroupName`, but not both.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # Specify either the name or ARN of the log group to view. If the log group is in a source account
    # and you are using a monitoring account, you must use the log group ARN.
    #
    # You must include either `logGroupIdentifier` or `logGroupName`, but not both.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The prefix to match.
    #
    # If `orderBy` is `LastEventTime`, you cannot specify this parameter.
    @[JSON::Field(key: "logStreamNamePrefix")]
    property log_stream_name_prefix : String | Nil

    # If the value is `LogStreamName`, the results are ordered by log stream name. If the value is
    # `LastEventTime`, the results are ordered by the event time. The default value is
    # `LogStreamName`.
    #
    # If you order the results by event time, you cannot specify the `logStreamNamePrefix` parameter.
    #
    # `lastEventTimestamp` represents the time of the most recent log event in the log stream in
    # CloudWatch Logs. This number is expressed as the number of milliseconds after `Jan 1, 1970
    # 00:00:00 UTC`. `lastEventTimestamp` updates on an eventual consistency basis. It typically
    # updates in less than an hour from ingestion, but in rare situations might take longer.
    @[JSON::Field(key: "orderBy", converter: ACWL::OrderBy)]
    property order_by : OrderBy | Nil

    # If the value is true, results are returned in descending order. If the value is to false,
    # results are returned in ascending order. The default value is false.
    @[JSON::Field(key: "descending")]
    property descending : Bool | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of items returned. If you don't specify a value, the default is up to 50
    # items.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @log_group_identifier : String | Nil = nil,
      @log_stream_name_prefix : String | Nil = nil,
      @order_by : OrderBy | Nil = nil,
      @descending : Bool | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
    )
    end
  end
end
