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
  end
end
