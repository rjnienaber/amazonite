private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class MetricAlarm
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

    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    @[JSON::Field(key: "Statistic", converter: ACW::Statistic)]
    property statistic : Statistic | Nil

    @[JSON::Field(key: "ExtendedStatistic")]
    property extended_statistic : String | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    @[JSON::Field(key: "Period")]
    property period : Int32 | Nil

    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    @[JSON::Field(key: "EvaluationPeriods")]
    property evaluation_periods : Int32 | Nil

    @[JSON::Field(key: "DatapointsToAlarm")]
    property datapoints_to_alarm : Int32 | Nil

    @[JSON::Field(key: "Threshold")]
    property threshold : Float64 | Nil

    @[JSON::Field(key: "ComparisonOperator", converter: ACW::ComparisonOperator)]
    property comparison_operator : ComparisonOperator | Nil

    @[JSON::Field(key: "TreatMissingData")]
    property treat_missing_data : String | Nil

    @[JSON::Field(key: "EvaluateLowSampleCountPercentile")]
    property evaluate_low_sample_count_percentile : String | Nil

    @[JSON::Field(key: "Metrics")]
    property metrics : Array(MetricDataQuery) | Nil

    @[JSON::Field(key: "ThresholdMetricId")]
    property threshold_metric_id : String | Nil

    @[JSON::Field(key: "EvaluationState", converter: ACW::EvaluationState)]
    property evaluation_state : EvaluationState | Nil

    @[JSON::Field(key: "StateTransitionedTimestamp", converter: Core::AWSEpochConverter)]
    property state_transitioned_timestamp : Time | Nil

    @[JSON::Field(key: "EvaluationWindow")]
    property evaluation_window : EvaluationWindow | Nil

    @[JSON::Field(key: "WarmUpConfiguration")]
    property warm_up_configuration : WarmUpConfiguration | Nil

    @[JSON::Field(key: "EvaluationCriteria")]
    property evaluation_criteria : EvaluationCriteria | Nil

    @[JSON::Field(key: "EvaluationInterval")]
    property evaluation_interval : Int32 | Nil

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
      @metric_name : String | Nil = nil,
      @namespace : String | Nil = nil,
      @statistic : Statistic | Nil = nil,
      @extended_statistic : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @period : Int32 | Nil = nil,
      @unit : StandardUnit | Nil = nil,
      @evaluation_periods : Int32 | Nil = nil,
      @datapoints_to_alarm : Int32 | Nil = nil,
      @threshold : Float64 | Nil = nil,
      @comparison_operator : ComparisonOperator | Nil = nil,
      @treat_missing_data : String | Nil = nil,
      @evaluate_low_sample_count_percentile : String | Nil = nil,
      @metrics : Array(MetricDataQuery) | Nil = nil,
      @threshold_metric_id : String | Nil = nil,
      @evaluation_state : EvaluationState | Nil = nil,
      @state_transitioned_timestamp : Time | Nil = nil,
      @evaluation_window : EvaluationWindow | Nil = nil,
      @warm_up_configuration : WarmUpConfiguration | Nil = nil,
      @evaluation_criteria : EvaluationCriteria | Nil = nil,
      @evaluation_interval : Int32 | Nil = nil,
    )
    end
  end
end
