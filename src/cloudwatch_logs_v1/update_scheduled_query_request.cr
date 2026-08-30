private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
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

    def_equals_and_hash(@identifier, @description, @query_language, @query_string, @log_group_identifiers, @schedule_expression, @timezone, @start_time_offset, @end_time_offset, @destination_configuration, @schedule_start_time, @schedule_end_time, @execution_role_arn, @state)
  end
end
