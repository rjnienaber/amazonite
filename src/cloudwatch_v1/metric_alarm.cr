private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # The details about a metric alarm.
  class MetricAlarm
    include JSON::Serializable

    # The name of the alarm.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    # The Amazon Resource Name (ARN) of the alarm.
    @[JSON::Field(key: "AlarmArn")]
    property alarm_arn : String | Nil

    # The description of the alarm.
    @[JSON::Field(key: "AlarmDescription")]
    property alarm_description : String | Nil

    # The time stamp of the last update to the alarm configuration.
    @[JSON::Field(key: "AlarmConfigurationUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property alarm_configuration_updated_timestamp : Time | Nil

    # Indicates whether actions should be executed during any changes to the alarm state.
    @[JSON::Field(key: "ActionsEnabled")]
    property actions_enabled : Bool | Nil

    # The actions to execute when this alarm transitions to the `OK` state from any other state. Each
    # action is specified as an Amazon Resource Name (ARN).
    @[JSON::Field(key: "OKActions")]
    property ok_actions : Array(String) | Nil

    # The actions to execute when this alarm transitions to the `ALARM` state from any other state.
    # Each action is specified as an Amazon Resource Name (ARN).
    @[JSON::Field(key: "AlarmActions")]
    property alarm_actions : Array(String) | Nil

    # The actions to execute when this alarm transitions to the `INSUFFICIENT_DATA` state from any
    # other state. Each action is specified as an Amazon Resource Name (ARN).
    @[JSON::Field(key: "InsufficientDataActions")]
    property insufficient_data_actions : Array(String) | Nil

    # The state value for the alarm.
    @[JSON::Field(key: "StateValue", converter: ACW::StateValue)]
    property state_value : StateValue | Nil

    # An explanation for the alarm state, in text format.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # An explanation for the alarm state, in JSON format.
    @[JSON::Field(key: "StateReasonData")]
    property state_reason_data : String | Nil

    # The time stamp of the last update to the value of either the `StateValue` or `EvaluationState`
    # parameters.
    @[JSON::Field(key: "StateUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property state_updated_timestamp : Time | Nil

    # The name of the metric associated with the alarm, if this is an alarm based on a single metric.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    # The namespace of the metric associated with the alarm.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # The statistic for the metric associated with the alarm, other than percentile. For percentile
    # statistics, use `ExtendedStatistic`.
    @[JSON::Field(key: "Statistic", converter: ACW::Statistic)]
    property statistic : Statistic | Nil

    # The percentile statistic for the metric associated with the alarm. Specify a value between p0.0
    # and p100.
    @[JSON::Field(key: "ExtendedStatistic")]
    property extended_statistic : String | Nil

    # The dimensions for the metric associated with the alarm.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    # The period, in seconds, over which the statistic is applied.
    @[JSON::Field(key: "Period")]
    property period : Int32 | Nil

    # The unit of the metric associated with the alarm.
    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    # The number of periods over which data is compared to the specified threshold.
    @[JSON::Field(key: "EvaluationPeriods")]
    property evaluation_periods : Int32 | Nil

    # The number of data points that must be breaching to trigger the alarm.
    @[JSON::Field(key: "DatapointsToAlarm")]
    property datapoints_to_alarm : Int32 | Nil

    # The value to compare with the specified statistic.
    @[JSON::Field(key: "Threshold")]
    property threshold : Float64 | Nil

    # The arithmetic operation to use when comparing the specified statistic and threshold. The
    # specified statistic value is used as the first operand.
    @[JSON::Field(key: "ComparisonOperator", converter: ACW::ComparisonOperator)]
    property comparison_operator : ComparisonOperator | Nil

    # Sets how this alarm is to handle missing data points. The valid values are `breaching`,
    # `notBreaching`, `ignore`, and `missing`. For more information, see [Configuring how CloudWatch
    # alarms treat missing
    # data](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html#alarms-and-missing-data).
    #
    # If this parameter is omitted, the default behavior of `missing` is used.
    #
    # This parameter is not applicable to PromQL alarms.
    @[JSON::Field(key: "TreatMissingData")]
    property treat_missing_data : String | Nil

    # Used only for alarms based on percentiles. If `ignore`, the alarm state does not change during
    # periods with too few data points to be statistically significant. If `evaluate` or this
    # parameter is not used, the alarm is always evaluated and possibly changes state no matter how
    # many data points are available.
    @[JSON::Field(key: "EvaluateLowSampleCountPercentile")]
    property evaluate_low_sample_count_percentile : String | Nil

    # An array of MetricDataQuery structures, used in an alarm based on a metric math expression. Each
    # structure either retrieves a metric or performs a math expression. One item in the Metrics array
    # is the math expression that the alarm watches. This expression by designated by having
    # `ReturnData` set to true.
    @[JSON::Field(key: "Metrics")]
    property metrics : Array(MetricDataQuery) | Nil

    # In an alarm based on an anomaly detection model, this is the ID of the `ANOMALY_DETECTION_BAND`
    # function used as the threshold for the alarm.
    @[JSON::Field(key: "ThresholdMetricId")]
    property threshold_metric_id : String | Nil

    # If the value of this field is `PARTIAL_DATA`, it indicates that not all the available data was
    # able to be retrieved due to quota limitations. For more information, see [Create alarms on
    # Metrics Insights
    # queries](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Metrics_Insights_Alarm.html).
    #
    # If the value of this field is `EVALUATION_ERROR`, it indicates configuration errors in alarm
    # setup that require review and correction. Refer to StateReason field of the alarm for more
    # details.
    #
    # If the value of this field is `EVALUATION_FAILURE`, it indicates temporary CloudWatch issues. We
    # recommend manual monitoring until the issue is resolved
    @[JSON::Field(key: "EvaluationState", converter: ACW::EvaluationState)]
    property evaluation_state : EvaluationState | Nil

    # The date and time that the alarm's `StateValue` most recently changed.
    @[JSON::Field(key: "StateTransitionedTimestamp", converter: Core::AWSEpochConverter)]
    property state_transitioned_timestamp : Time | Nil

    # The evaluation window that the alarm uses to select the range of metric data that it evaluates.
    # This is either a sliding window or a wall clock window. For more information, see [Alarm
    # evaluation
    # windows](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/alarm-evaluation-window.html)
    # in the *CloudWatch User Guide*.
    @[JSON::Field(key: "EvaluationWindow")]
    property evaluation_window : EvaluationWindow | Nil

    # The warm-up configuration for the alarm. A warm-up period delays alarm evaluation after you
    # create or update the alarm. During the warm-up period, the alarm stays in `INSUFFICIENT_DATA`
    # and does not perform alarm actions.
    #
    # For more information, see [Alarm warm-up
    # periods](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/alarm-warm-up.html) in
    # the *Amazon CloudWatch User Guide*.
    @[JSON::Field(key: "WarmUpConfiguration")]
    property warm_up_configuration : WarmUpConfiguration | Nil

    # The evaluation criteria for the alarm.
    @[JSON::Field(key: "EvaluationCriteria")]
    property evaluation_criteria : EvaluationCriteria | Nil

    # The frequency, in seconds, at which the alarm is evaluated.
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
