private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # Summary information about a scheduled query, including basic configuration and execution status.
  class ScheduledQuerySummary
    include JSON::Serializable

    # The ARN of the scheduled query.
    @[JSON::Field(key: "scheduledQueryArn")]
    property scheduled_query_arn : String | Nil

    # The name of the scheduled query.
    @[JSON::Field(key: "name")]
    property name : String | Nil

    # The current state of the scheduled query.
    @[JSON::Field(key: "state", converter: ACWL::ScheduledQueryState)]
    property state : ScheduledQueryState | Nil

    # The schedule type of the scheduled query. Valid values are `CUSTOMER_MANAGED` and `AWS_MANAGED`.
    @[JSON::Field(key: "scheduleType", converter: ACWL::ScheduleType)]
    property schedule_type : ScheduleType | Nil

    # The timestamp when the scheduled query was last executed.
    @[JSON::Field(key: "lastTriggeredTime")]
    property last_triggered_time : Int64 | Nil

    # The status of the most recent execution.
    @[JSON::Field(key: "lastExecutionStatus", converter: ACWL::ExecutionStatus)]
    property last_execution_status : ExecutionStatus | Nil

    # The cron expression that defines when the scheduled query runs.
    @[JSON::Field(key: "scheduleExpression")]
    property schedule_expression : String | Nil

    # The timezone used for evaluating the schedule expression.
    @[JSON::Field(key: "timezone")]
    property timezone : String | Nil

    # Configuration for where query results are delivered.
    @[JSON::Field(key: "destinationConfiguration")]
    property destination_configuration : DestinationConfiguration | Nil

    # The timestamp when the scheduled query was created.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The timestamp when the scheduled query was last updated.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    def initialize(
      @scheduled_query_arn : String | Nil = nil,
      @name : String | Nil = nil,
      @state : ScheduledQueryState | Nil = nil,
      @schedule_type : ScheduleType | Nil = nil,
      @last_triggered_time : Int64 | Nil = nil,
      @last_execution_status : ExecutionStatus | Nil = nil,
      @schedule_expression : String | Nil = nil,
      @timezone : String | Nil = nil,
      @destination_configuration : DestinationConfiguration | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
    )
    end
  end
end
