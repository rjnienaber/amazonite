private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class GetScheduledQueryResponse
    include JSON::Serializable

    # The ARN of the scheduled query.
    @[JSON::Field(key: "scheduledQueryArn")]
    property scheduled_query_arn : String | Nil

    # The name of the scheduled query.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The description of the scheduled query.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The query language used by the scheduled query.
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    # The query string executed by the scheduled query.
    @[JSON::Field(key: "queryString")]
    property query_string : String | Nil

    # The log groups queried by the scheduled query.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    # The cron expression that defines when the scheduled query runs.
    @[JSON::Field(key: "scheduleExpression")]
    property schedule_expression : String | Nil

    # The timezone used for evaluating the schedule expression.
    @[JSON::Field(key: "timezone")]
    property timezone : String | Nil

    # The time offset in seconds that defines the lookback period for the query.
    @[JSON::Field(key: "startTimeOffset")]
    property start_time_offset : Int64 | Nil

    # The time offset in seconds that defines the end of the lookback period for the query.
    @[JSON::Field(key: "endTimeOffset")]
    property end_time_offset : Int64 | Nil

    # Configuration for where query results are delivered.
    @[JSON::Field(key: "destinationConfiguration")]
    property destination_configuration : DestinationConfiguration | Nil

    # The current state of the scheduled query.
    @[JSON::Field(key: "state", converter: ACWL::ScheduledQueryState)]
    property state : ScheduledQueryState | Nil

    # The schedule type of the scheduled query. Valid values are `CUSTOMER_MANAGED` and `AWS_MANAGED`.
    @[JSON::Field(key: "scheduleType", converter: ACWL::ScheduleType)]
    property schedule_type : ScheduleType | Nil

    # The timestamp when the scheduled query was last executed.
    @[JSON::Field(key: "lastTriggeredTime")]
    property last_triggered_time : Int64 | Nil

    # The status of the most recent execution of the scheduled query.
    @[JSON::Field(key: "lastExecutionStatus", converter: ACWL::ExecutionStatus)]
    property last_execution_status : ExecutionStatus | Nil

    # The start time for the scheduled query in Unix epoch format.
    @[JSON::Field(key: "scheduleStartTime")]
    property schedule_start_time : Int64 | Nil

    # The end time for the scheduled query in Unix epoch format.
    @[JSON::Field(key: "scheduleEndTime")]
    property schedule_end_time : Int64 | Nil

    # The ARN of the IAM role used to execute the query and deliver results.
    @[JSON::Field(key: "executionRoleArn")]
    property execution_role_arn : String | Nil

    # The timestamp when the scheduled query was created.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The timestamp when the scheduled query was last updated.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    def initialize(
      @scheduled_query_arn : String | Nil = nil,
      @name : String | Nil = nil,
      @description : String | Nil = nil,
      @query_language : QueryLanguage | Nil = nil,
      @query_string : String | Nil = nil,
      @log_group_identifiers : Array(String) | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @timezone : String | Nil = nil,
      @start_time_offset : Int64 | Nil = nil,
      @end_time_offset : Int64 | Nil = nil,
      @destination_configuration : DestinationConfiguration | Nil = nil,
      @state : ScheduledQueryState | Nil = nil,
      @schedule_type : ScheduleType | Nil = nil,
      @last_triggered_time : Int64 | Nil = nil,
      @last_execution_status : ExecutionStatus | Nil = nil,
      @schedule_start_time : Int64 | Nil = nil,
      @schedule_end_time : Int64 | Nil = nil,
      @execution_role_arn : String | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("name length must be <= 300") if value.size > 300
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

      if value = @last_triggered_time
        raise Core::ValidationError.new("lastTriggeredTime value must be >= 0") if value < 0
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

      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end

      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@scheduled_query_arn, @name, @description, @query_language, @query_string, @log_group_identifiers, @schedule_expression, @timezone, @start_time_offset, @end_time_offset, @destination_configuration, @state, @schedule_type, @last_triggered_time, @last_execution_status, @schedule_start_time, @schedule_end_time, @execution_role_arn, @creation_time, @last_updated_time)
  end
end
