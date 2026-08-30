private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class CreateScheduledQueryRequest
    include JSON::Serializable

    # The name of the scheduled query. The name must be unique within your account and region. Length
    # must be between 1 and 300 characters.
    @[JSON::Field(key: "name")]
    property name : String

    # An optional description for the scheduled query to help identify its purpose and functionality.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The query language to use for the scheduled query. Valid values are `CWLI`, `PPL`, and `SQL`.
    @[JSON::Field(key: "queryLanguage", converter: ACWL::QueryLanguage)]
    property query_language : QueryLanguage

    # The query string to execute. This is the same query syntax used in CloudWatch Logs Insights.
    # Maximum length is 10,000 characters.
    @[JSON::Field(key: "queryString")]
    property query_string : String

    # An array of log group names or ARNs to query. You can specify between 1 and 50 log groups. Log
    # groups can be identified by name or full ARN.
    @[JSON::Field(key: "logGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    # A cron expression that defines when the scheduled query runs. The expression uses standard cron
    # syntax and supports minute-level precision. Maximum length is 256 characters.
    @[JSON::Field(key: "scheduleExpression")]
    property schedule_expression : String

    # The timezone for evaluating the schedule expression. This determines when the scheduled query
    # executes relative to the specified timezone.
    @[JSON::Field(key: "timezone")]
    property timezone : String | Nil

    # The time offset in seconds that defines the lookback period for the query. This determines how
    # far back in time the query searches from the execution time.
    @[JSON::Field(key: "startTimeOffset")]
    property start_time_offset : Int64 | Nil

    # The time offset in seconds that defines the end of the lookback period for the query. Together
    # with `startTimeOffset`, this determines the time window relative to the execution time over
    # which the query runs.
    @[JSON::Field(key: "endTimeOffset")]
    property end_time_offset : Int64 | Nil

    # Configuration for where to deliver query results. Supports Amazon S3 destinations for storing
    # query output and lookup table destinations for automatically refreshing lookup tables with query
    # results. You can configure one or both destination types.
    @[JSON::Field(key: "destinationConfiguration")]
    property destination_configuration : DestinationConfiguration | Nil

    # The start time for the scheduled query in Unix epoch format. The query will not execute before
    # this time.
    @[JSON::Field(key: "scheduleStartTime")]
    property schedule_start_time : Int64 | Nil

    # The end time for the scheduled query in Unix epoch format. The query will stop executing after
    # this time.
    @[JSON::Field(key: "scheduleEndTime")]
    property schedule_end_time : Int64 | Nil

    # The ARN of the IAM role that grants permissions to execute the query and deliver results to the
    # specified destination. The role must have permissions to read from the specified log groups and
    # write to the destination.
    @[JSON::Field(key: "executionRoleArn")]
    property execution_role_arn : String

    # The initial state of the scheduled query. Valid values are `ENABLED` and `DISABLED`. Default is
    # `ENABLED`.
    @[JSON::Field(key: "state", converter: ACWL::ScheduledQueryState)]
    property state : ScheduledQueryState | Nil

    # Key-value pairs to associate with the scheduled query for resource management and cost
    # allocation.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @name : String,
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
      @tags : Hash(String, String) | Nil = nil,
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

      if value = @schedule_start_time
        raise Core::ValidationError.new("scheduleStartTime value must be >= 0") if value < 0
      end

      if value = @schedule_end_time
        raise Core::ValidationError.new("scheduleEndTime value must be >= 0") if value < 0
      end

      if value = @execution_role_arn
        raise Core::ValidationError.new("executionRoleArn length must be >= 1") if value.size < 1
      end

      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@name, @description, @query_language, @query_string, @log_group_identifiers, @schedule_expression, @timezone, @start_time_offset, @end_time_offset, @destination_configuration, @schedule_start_time, @schedule_end_time, @execution_role_arn, @state, @tags)
  end
end
