private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # The configuration of the CloudWatch Logs scheduled query that backs a log alarm.
  class ScheduledQueryConfiguration
    include JSON::Serializable

    # The CloudWatch Logs query to execute on each scheduled run. Length constraints: maximum of
    # 10,000 characters.
    @[JSON::Field(key: "QueryString")]
    property query_string : String

    # The log groups to query. Each entry can be a log group name or ARN. Use the ARN form when
    # querying log groups in a different account (for example, when running cross-account queries from
    # a monitoring account). The list must contain between 1 and 50 entries.
    @[JSON::Field(key: "LogGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    # The Amazon Resource Name (ARN) of the CloudWatch Logs scheduled query that the alarm uses. This
    # field is populated in `DescribeAlarms` responses.
    @[JSON::Field(key: "QueryARN")]
    property query_arn : String | Nil

    # The Amazon Resource Name (ARN) of the IAM role that CloudWatch assumes when executing the
    # scheduled query against the configured log groups.
    @[JSON::Field(key: "ScheduledQueryRoleARN")]
    property scheduled_query_role_arn : String

    # The schedule and time-range offset configuration for the underlying scheduled query.
    @[JSON::Field(key: "ScheduleConfiguration")]
    property schedule_configuration : ScheduleConfiguration

    # The expression that defines how to aggregate query results into one or more scalar values for
    # alarm evaluation. For example, `count(*)` or `avg(latency) by host | sort desc`. Length
    # constraints: minimum 1 character, maximum 2048 characters.
    @[JSON::Field(key: "AggregationExpression")]
    property aggregation_expression : String

    # A list of key-value pairs to associate with the underlying scheduled query resource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @query_string : String,
      @scheduled_query_role_arn : String,
      @schedule_configuration : ScheduleConfiguration,
      @aggregation_expression : String,
      @log_group_identifiers : Array(String) | Nil = nil,
      @query_arn : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @query_string
        raise Core::ValidationError.new("QueryString length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("QueryString length must be <= 10000") if value.size > 10000
      end

      if value = @log_group_identifiers
        raise Core::ValidationError.new("LogGroupIdentifiers must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("LogGroupIdentifiers must have at most 50 item(s)") if value.size > 50
      end

      if value = @query_arn
        raise Core::ValidationError.new("QueryARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("QueryARN length must be <= 1024") if value.size > 1024
      end

      if value = @scheduled_query_role_arn
        raise Core::ValidationError.new("ScheduledQueryRoleARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ScheduledQueryRoleARN length must be <= 1024") if value.size > 1024
      end

      if value = @schedule_configuration
        value.validate!
      end

      if value = @aggregation_expression
        raise Core::ValidationError.new("AggregationExpression length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AggregationExpression length must be <= 2048") if value.size > 2048
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@query_string, @log_group_identifiers, @query_arn, @scheduled_query_role_arn, @schedule_configuration, @aggregation_expression, @tags)
  end
end
