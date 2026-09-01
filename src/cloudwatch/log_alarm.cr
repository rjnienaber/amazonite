private alias ACW = Amazonite::CloudWatch
private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # The details about a log alarm.
  class LogAlarm
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

    # The configuration of the underlying CloudWatch Logs scheduled query, including the query string,
    # log groups, schedule, aggregation expression, and the ARN of the managed scheduled query.
    @[JSON::Field(key: "ScheduledQueryConfiguration")]
    property scheduled_query_configuration : ScheduledQueryConfiguration | Nil

    # The number of most recent scheduled query results that the alarm evaluates against the threshold
    # (the N in M-of-N evaluation).
    @[JSON::Field(key: "QueryResultsToEvaluate")]
    property query_results_to_evaluate : Int32 | Nil

    # The number of query results, out of the most recent `QueryResultsToEvaluate` results, that must
    # breach the threshold to trigger the alarm to transition to `ALARM` (the M in M-of-N evaluation).
    @[JSON::Field(key: "QueryResultsToAlarm")]
    property query_results_to_alarm : Int32 | Nil

    # The value to compare with the aggregated query result.
    @[JSON::Field(key: "Threshold")]
    property threshold : Float64 | Nil

    # The arithmetic operation to use when comparing the aggregated query result and the threshold.
    # The aggregated query result is used as the first operand.
    @[JSON::Field(key: "ComparisonOperator", converter: ACW::ComparisonOperator)]
    property comparison_operator : ComparisonOperator | Nil

    # How this alarm handles missing data points. Valid values are `breaching`, `notBreaching`,
    # `ignore`, and `missing`.
    @[JSON::Field(key: "TreatMissingData")]
    property treat_missing_data : String | Nil

    # The date and time that the alarm's `StateValue` most recently changed.
    @[JSON::Field(key: "StateTransitionedTimestamp", converter: Core::AWSEpochConverter)]
    property state_transitioned_timestamp : Time | Nil

    # If the value of this field is `EVALUATION_ERROR`, it indicates configuration errors in the alarm
    # setup that require review and correction. Refer to the `StateReason` field of the alarm for more
    # details.
    #
    # If the value of this field is `EVALUATION_FAILURE`, it indicates temporary CloudWatch issues. We
    # recommend manual monitoring until the issue is resolved.
    #
    # If the value of this field is `PARTIAL_DATA`, it indicates that the query returned the maximum
    # 500 contributor groups but more matched. The alarm evaluates the available contributors, but
    # results might be incomplete.
    @[JSON::Field(key: "EvaluationState", converter: ACW::EvaluationState)]
    property evaluation_state : EvaluationState | Nil

    # The number of log lines from the most recent scheduled query execution that are included in
    # alarm action notifications. Valid range is 0 through 50. A value of 0 means no log lines are
    # included.
    @[JSON::Field(key: "ActionLogLineCount")]
    property action_log_line_count : Int32 | Nil

    # The Amazon Resource Name (ARN) of the IAM role that CloudWatch assumes to retrieve log events
    # for inclusion in alarm action notifications. Set when `ActionLogLineCount` is greater than 0.
    @[JSON::Field(key: "ActionLogLineRoleArn")]
    property action_log_line_role_arn : String | Nil

    # The warm-up configuration for the alarm. A warm-up period delays alarm evaluation after you
    # create or update the alarm. During the warm-up period, the alarm stays in `INSUFFICIENT_DATA`
    # and does not perform alarm actions.
    #
    # For more information, see [Alarm warm-up
    # periods](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/alarm-warm-up.html) in
    # the *Amazon CloudWatch User Guide*.
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

    def validate! : Nil
      if value = @alarm_name
        raise Core::ValidationError.new("AlarmName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmName length must be <= 255") if value.size > 255
      end

      if value = @alarm_arn
        raise Core::ValidationError.new("AlarmArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmArn length must be <= 1600") if value.size > 1600
      end

      if value = @alarm_description
        raise Core::ValidationError.new("AlarmDescription length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("AlarmDescription length must be <= 1024") if value.size > 1024
      end

      if value = @ok_actions
        raise Core::ValidationError.new("OKActions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("OKActions must have at most 5 item(s)") if value.size > 5
      end

      if value = @alarm_actions
        raise Core::ValidationError.new("AlarmActions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AlarmActions must have at most 5 item(s)") if value.size > 5
      end

      if value = @insufficient_data_actions
        raise Core::ValidationError.new("InsufficientDataActions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("InsufficientDataActions must have at most 5 item(s)") if value.size > 5
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 1023") if value.size > 1023
      end

      if value = @state_reason_data
        raise Core::ValidationError.new("StateReasonData length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReasonData length must be <= 4000") if value.size > 4000
      end

      if value = @scheduled_query_configuration
        value.validate!
      end

      if value = @query_results_to_evaluate
        raise Core::ValidationError.new("QueryResultsToEvaluate value must be >= 1") if value < 1
      end

      if value = @query_results_to_alarm
        raise Core::ValidationError.new("QueryResultsToAlarm value must be >= 1") if value < 1
      end

      if value = @treat_missing_data
        raise Core::ValidationError.new("TreatMissingData length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TreatMissingData length must be <= 255") if value.size > 255
      end

      if value = @warm_up_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@alarm_name, @alarm_arn, @alarm_description, @alarm_configuration_updated_timestamp, @actions_enabled, @ok_actions, @alarm_actions, @insufficient_data_actions, @state_value, @state_reason, @state_reason_data, @state_updated_timestamp, @scheduled_query_configuration, @query_results_to_evaluate, @query_results_to_alarm, @threshold, @comparison_operator, @treat_missing_data, @state_transitioned_timestamp, @evaluation_state, @action_log_line_count, @action_log_line_role_arn, @warm_up_configuration)
  end
end
