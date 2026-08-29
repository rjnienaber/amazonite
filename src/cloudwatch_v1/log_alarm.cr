private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class LogAlarm
    include JSON::Serializable

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    @[JSON::Field(key: "AlarmArn")]
    property alarm_arn : String | Nil

    @[JSON::Field(key: "AlarmDescription")]
    property alarm_description : String | Nil

    @[JSON::Field(key: "AlarmConfigurationUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property alarm_configuration_updated_timestamp : Time | Nil

    @[JSON::Field(key: "ActionsEnabled")]
    property actions_enabled : Bool | Nil

    @[JSON::Field(key: "OKActions")]
    property ok_actions : Array(String) | Nil

    @[JSON::Field(key: "AlarmActions")]
    property alarm_actions : Array(String) | Nil

    @[JSON::Field(key: "InsufficientDataActions")]
    property insufficient_data_actions : Array(String) | Nil

    @[JSON::Field(key: "StateValue", converter: ACW::StateValue)]
    property state_value : StateValue | Nil

    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    @[JSON::Field(key: "StateReasonData")]
    property state_reason_data : String | Nil

    @[JSON::Field(key: "StateUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property state_updated_timestamp : Time | Nil

    @[JSON::Field(key: "ScheduledQueryConfiguration")]
    property scheduled_query_configuration : ScheduledQueryConfiguration | Nil

    @[JSON::Field(key: "QueryResultsToEvaluate")]
    property query_results_to_evaluate : Int32 | Nil

    @[JSON::Field(key: "QueryResultsToAlarm")]
    property query_results_to_alarm : Int32 | Nil

    @[JSON::Field(key: "Threshold")]
    property threshold : Float64 | Nil

    @[JSON::Field(key: "ComparisonOperator", converter: ACW::ComparisonOperator)]
    property comparison_operator : ComparisonOperator | Nil

    @[JSON::Field(key: "TreatMissingData")]
    property treat_missing_data : String | Nil

    @[JSON::Field(key: "StateTransitionedTimestamp", converter: Core::AWSEpochConverter)]
    property state_transitioned_timestamp : Time | Nil

    @[JSON::Field(key: "EvaluationState", converter: ACW::EvaluationState)]
    property evaluation_state : EvaluationState | Nil

    @[JSON::Field(key: "ActionLogLineCount")]
    property action_log_line_count : Int32 | Nil

    @[JSON::Field(key: "ActionLogLineRoleArn")]
    property action_log_line_role_arn : String | Nil

    @[JSON::Field(key: "WarmUpConfiguration")]
    property warm_up_configuration : WarmUpConfiguration | Nil

    def initialize(
      @alarm_name : String | Nil = nil,
      @alarm_arn : String | Nil = nil,
      @alarm_description : String | Nil = nil,
      @alarm_configuration_updated_timestamp : Time | Nil = nil,
      @actions_enabled : Bool | Nil = nil,
      @ok_actions : Array(String) | Nil = nil,
      @alarm_actions : Array(String) | Nil = nil,
      @insufficient_data_actions : Array(String) | Nil = nil,
      @state_value : StateValue | Nil = nil,
      @state_reason : String | Nil = nil,
      @state_reason_data : String | Nil = nil,
      @state_updated_timestamp : Time | Nil = nil,
      @scheduled_query_configuration : ScheduledQueryConfiguration | Nil = nil,
      @query_results_to_evaluate : Int32 | Nil = nil,
      @query_results_to_alarm : Int32 | Nil = nil,
      @threshold : Float64 | Nil = nil,
      @comparison_operator : ComparisonOperator | Nil = nil,
      @treat_missing_data : String | Nil = nil,
      @state_transitioned_timestamp : Time | Nil = nil,
      @evaluation_state : EvaluationState | Nil = nil,
      @action_log_line_count : Int32 | Nil = nil,
      @action_log_line_role_arn : String | Nil = nil,
      @warm_up_configuration : WarmUpConfiguration | Nil = nil,
    )
    end
  end
end
