private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class PutLogAlarmInput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String

    @[JSON::Field(key: "AlarmDescription")]
    property alarm_description : String | Nil

    @[JSON::Field(key: "ScheduledQueryConfiguration")]
    property scheduled_query_configuration : ScheduledQueryConfiguration

    @[JSON::Field(key: "ActionLogLineCount")]
    property action_log_line_count : Int32 | Nil

    @[JSON::Field(key: "ActionLogLineRoleArn")]
    property action_log_line_role_arn : String | Nil

    @[JSON::Field(key: "ActionsEnabled")]
    property actions_enabled : Bool | Nil

    @[JSON::Field(key: "OKActions")]
    property ok_actions : Array(String) | Nil

    @[JSON::Field(key: "AlarmActions")]
    property alarm_actions : Array(String) | Nil

    @[JSON::Field(key: "InsufficientDataActions")]
    property insufficient_data_actions : Array(String) | Nil

    @[JSON::Field(key: "QueryResultsToEvaluate")]
    property query_results_to_evaluate : Int32

    @[JSON::Field(key: "QueryResultsToAlarm")]
    property query_results_to_alarm : Int32

    @[JSON::Field(key: "Threshold")]
    property threshold : Float64

    @[JSON::Field(key: "ComparisonOperator", converter: ACW::ComparisonOperator)]
    property comparison_operator : ComparisonOperator

    @[JSON::Field(key: "TreatMissingData")]
    property treat_missing_data : String | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    @[JSON::Field(key: "WarmUpConfiguration")]
    property warm_up_configuration : WarmUpConfiguration | Nil

    def initialize(
      @alarm_name : String,
      @scheduled_query_configuration : ScheduledQueryConfiguration,
      @query_results_to_evaluate : Int32,
      @query_results_to_alarm : Int32,
      @threshold : Float64,
      @comparison_operator : ComparisonOperator,
      @alarm_description : String | Nil = nil,
      @action_log_line_count : Int32 | Nil = nil,
      @action_log_line_role_arn : String | Nil = nil,
      @actions_enabled : Bool | Nil = nil,
      @ok_actions : Array(String) | Nil = nil,
      @alarm_actions : Array(String) | Nil = nil,
      @insufficient_data_actions : Array(String) | Nil = nil,
      @treat_missing_data : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @warm_up_configuration : WarmUpConfiguration | Nil = nil,
    )
    end
  end
end
