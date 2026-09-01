private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class UpdateScheduledQueryRequest
    include JSON::Serializable

    # The ARN or name of the scheduled query to update.
    @[JSON::Field(key: "identifier")]
    property identifier : String

    # An updated description for the scheduled query.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The updated query language for the scheduled query.
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage

    # The updated query string to execute.
    @[JSON::Field(key: "queryString")]
    property query_string : String

    # The updated array of log group names or ARNs to query.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    # The updated cron expression that defines when the scheduled query runs.
    @[JSON::Field(key: "scheduleExpression")]
    property schedule_expression : String

    # The updated timezone for evaluating the schedule expression.
    @[JSON::Field(key: "timezone")]
    property timezone : String | Nil

    # The updated time offset in seconds that defines the lookback period for the query.
    @[JSON::Field(key: "startTimeOffset")]
    property start_time_offset : Int64 | Nil

    # The updated time offset in seconds that defines the end of the lookback period for the query.
    @[JSON::Field(key: "endTimeOffset")]
    property end_time_offset : Int64 | Nil

    # The updated configuration for where to deliver query results.
    @[JSON::Field(key: "destinationConfiguration")]
    property destination_configuration : DestinationConfiguration | Nil

    # The updated start time for the scheduled query in Unix epoch format.
    @[JSON::Field(key: "scheduleStartTime")]
    property schedule_start_time : Int64 | Nil

    # The updated end time for the scheduled query in Unix epoch format.
    @[JSON::Field(key: "scheduleEndTime")]
    property schedule_end_time : Int64 | Nil

    # The updated ARN of the IAM role that grants permissions to execute the query and deliver
    # results.
    @[JSON::Field(key: "executionRoleArn")]
    property execution_role_arn : String

    # The updated state of the scheduled query.
    @[JSON::Field(key: "state", converter: ACWL::ScheduledQueryState)]
    property state : ScheduledQueryState | Nil

    def initialize(
      @identifier : String,
      @query_language : QueryLanguage,
      @query_string : String,
      @schedule_expression : String,
      @execution_role_arn : String,
      @description : String | Nil = nil,
      @log_group_identifiers : Array(String) | Nil = nil,
      @timezone : String | Nil = nil,
      @start_time_offset : Int64 | Nil = nil,
      @end_time_offset : Int64 | Nil = nil,
      @destination_configuration : DestinationConfiguration | Nil = nil,
      @schedule_start_time : Int64 | Nil = nil,
      @schedule_end_time : Int64 | Nil = nil,
      @state : ScheduledQueryState | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @identifier
        raise Core::ValidationError.new("identifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("identifier length must be <= 300") if value.size > 300
      end

      if value = @description
        raise Core::ValidationError.new("description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("description length must be <= 1024") if value.size > 1024
      end

      if value = @query_string
        raise Core::ValidationError.new("queryString length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("queryString length must be <= 10000") if value.size > 10000
      end

      if value = @log_group_identifiers
        raise Core::ValidationError.new("logGroupIdentifiers must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifiers must have at most 50 item(s)") if value.size > 50
      end

      if value = @schedule_expression
        raise Core::ValidationError.new("scheduleExpression length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("scheduleExpression length must be <= 256") if value.size > 256
      end

      if value = @timezone
        raise Core::ValidationError.new("timezone length must be >= 1") if value.size < 1
      end

      if value = @destination_configuration
        value.validate!
      end

      if value = @schedule_start_time
        raise Core::ValidationError.new("scheduleStartTime value must be >= 0") if value < 0
      end

      if value = @schedule_end_time
        raise Core::ValidationError.new("scheduleEndTime value must be >= 0") if value < 0
      end

      if value = @execution_role_arn
        raise Core::ValidationError.new("executionRoleArn length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@identifier, @description, @query_language, @query_string, @log_group_identifiers, @schedule_expression, @timezone, @start_time_offset, @end_time_offset, @destination_configuration, @schedule_start_time, @schedule_end_time, @execution_role_arn, @state)
  end
end
