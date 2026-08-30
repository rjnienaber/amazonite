private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @time
        raise Core::ValidationError.new("time value must be >= 0") if value < 0
      end

      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end
    end

    def_equals_and_hash(@log_group_name, @time, @log_group_identifier)
  end
end
