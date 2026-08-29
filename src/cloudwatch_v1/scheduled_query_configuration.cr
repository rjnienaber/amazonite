module Amazonite::CloudWatchV1
  class ScheduledQueryConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "QueryString")]
    property query_string : String

    @[JSON::Field(key: "LogGroupIdentifiers")]
    property log_group_identifiers : Array(String) | Nil

    @[JSON::Field(key: "QueryARN")]
    property query_arn : String | Nil

    @[JSON::Field(key: "ScheduledQueryRoleARN")]
    property scheduled_query_role_arn : String

    @[JSON::Field(key: "ScheduleConfiguration")]
    property schedule_configuration : ScheduleConfiguration

    @[JSON::Field(key: "AggregationExpression")]
    property aggregation_expression : String

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
