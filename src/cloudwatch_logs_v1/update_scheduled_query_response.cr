private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class UpdateScheduledQueryResponse
    include JSON::Serializable

    # The ARN of the updated scheduled query.
    @[JSON::Field(key: "scheduledQueryArn")]
    property scheduled_query_arn : String | Nil

    # The name of the updated scheduled query.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The description of the updated scheduled query.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The query language of the updated scheduled query.
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage | Nil

    # The query string of the updated scheduled query.
    @[JSON::Field(key: "queryString")]
    property query_string : String | Nil

    # The log groups queried by the updated scheduled query.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    # The cron expression of the updated scheduled query.
    @[JSON::Field(key: "scheduleExpression")]
    property schedule_expression : String | Nil

    # The timezone of the updated scheduled query.
    @[JSON::Field(key: "timezone")]
    property timezone : String | Nil

    # The time offset of the updated scheduled query.
    @[JSON::Field(key: "startTimeOffset")]
    property start_time_offset : Int64 | Nil

    # The end time offset in seconds of the updated scheduled query.
    @[JSON::Field(key: "endTimeOffset")]
    property end_time_offset : Int64 | Nil

    # The destination configuration of the updated scheduled query.
    @[JSON::Field(key: "destinationConfiguration")]
    property destination_configuration : DestinationConfiguration | Nil

    # The state of the updated scheduled query.
    @[JSON::Field(key: "state", converter: ACWL::ScheduledQueryState)]
    property state : ScheduledQueryState | Nil

    # The schedule type of the updated scheduled query.
    @[JSON::Field(key: "scheduleType", converter: ACWL::ScheduleType)]
    property schedule_type : ScheduleType | Nil

    # The timestamp when the updated scheduled query was last executed.
    @[JSON::Field(key: "lastTriggeredTime")]
    property last_triggered_time : Int64 | Nil

    # The status of the most recent execution of the updated scheduled query.
    @[JSON::Field(key: "lastExecutionStatus", converter: ACWL::ExecutionStatus)]
    property last_execution_status : ExecutionStatus | Nil

    # The start time of the updated scheduled query.
    @[JSON::Field(key: "scheduleStartTime")]
    property schedule_start_time : Int64 | Nil

    # The end time of the updated scheduled query.
    @[JSON::Field(key: "scheduleEndTime")]
    property schedule_end_time : Int64 | Nil

    # The execution role ARN of the updated scheduled query.
    @[JSON::Field(key: "executionRoleArn")]
    property execution_role_arn : String | Nil

    # The timestamp when the scheduled query was originally created.
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

    def_equals_and_hash(@scheduled_query_arn, @name, @description, @query_language, @query_string, @log_group_identifiers, @schedule_expression, @timezone, @start_time_offset, @end_time_offset, @destination_configuration, @state, @schedule_type, @last_triggered_time, @last_execution_status, @schedule_start_time, @schedule_end_time, @execution_role_arn, @creation_time, @last_updated_time)
  end
end
