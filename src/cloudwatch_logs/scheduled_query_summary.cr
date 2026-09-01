private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("name length must be <= 300") if value.size > 300
      end

      if value = @last_triggered_time
        raise Core::ValidationError.new("lastTriggeredTime value must be >= 0") if value < 0
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

      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end

      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@scheduled_query_arn, @name, @state, @schedule_type, @last_triggered_time, @last_execution_status, @schedule_expression, @timezone, @destination_configuration, @creation_time, @last_updated_time)
  end
end
