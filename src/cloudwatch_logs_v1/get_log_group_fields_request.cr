module Amazonite::CloudWatchLogsV1
  class GetLogGroupFieldsRequest
    include JSON::Serializable

    # The name of the log group to search.
    #
    # You must include either `logGroupIdentifier` or `logGroupName`, but not both.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The time to set as the center of the query. If you specify `time`, the 8 minutes before and 8
    # minutes after this time are searched. If you omit `time`, the most recent 15 minutes up to the
    # current time are searched.
    #
    # The `time` value is specified as epoch time, which is the number of seconds since `January 1,
    # 1970, 00:00:00 UTC`.
    @[JSON::Field(key: "time")]
    property time : Int64 | Nil

    # Specify either the name or ARN of the log group to view. If the log group is in a source account
    # and you are using a monitoring account, you must specify the ARN.
    #
    # You must include either `logGroupIdentifier` or `logGroupName`, but not both.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @time : Int64 | Nil = nil,
      @log_group_identifier : String | Nil = nil,
    )
    end
  end
end
