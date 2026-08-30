private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class PutLogAlarmInput
    include JSON::Serializable

    # The name for the alarm. This name must be unique within the Amazon Web Services account and
    # Region.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String

    # The description for the alarm.
    @[JSON::Field(key: "AlarmDescription")]
    property alarm_description : String | Nil

    # The configuration of the underlying CloudWatch Logs scheduled query that this alarm evaluates,
    # including the query string, log groups, schedule, and aggregation expression.
    @[JSON::Field(key: "ScheduledQueryConfiguration")]
    property scheduled_query_configuration : ScheduledQueryConfiguration

    # The number of log lines from the most recent scheduled query execution to include in alarm
    # action notifications. Valid range is 0 through 50. The default is 0, which means no log lines
    # are included.
    @[JSON::Field(key: "ActionLogLineCount")]
    property action_log_line_count : Int32 | Nil

    # The Amazon Resource Name (ARN) of an IAM role that CloudWatch assumes to retrieve log events for
    # inclusion in alarm action notifications. Required when `ActionLogLineCount` is greater than 0.
    @[JSON::Field(key: "ActionLogLineRoleArn")]
    property action_log_line_role_arn : String | Nil

    # Indicates whether actions should be executed during any changes to the alarm state. The default
    # is `true`.
    @[JSON::Field(key: "ActionsEnabled")]
    property actions_enabled : Bool | Nil

    # The actions to execute when this alarm transitions to the `OK` state from any other state. Each
    # action is specified as an Amazon Resource Name (ARN).
    #
    # Valid Values:
    #
    # **Amazon SNS actions:**
    #
    # `arn:aws:sns:*region*:*account-id*:*sns-topic-name* `
    #
    # **Lambda actions:**
    #
    # - Invoke the latest version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name* `
    #
    # - Invoke a specific version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*version-number* `
    #
    # - Invoke a function by using an alias Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*alias-name* `
    @[JSON::Field(key: "OKActions")]
    property ok_actions : Array(String) | Nil

    # The actions to execute when this alarm transitions to the `ALARM` state from any other state.
    # Each action is specified as an Amazon Resource Name (ARN).
    #
    # Valid Values:
    #
    # **Amazon SNS actions:**
    #
    # `arn:aws:sns:*region*:*account-id*:*sns-topic-name* `
    #
    # **Lambda actions:**
    #
    # - Invoke the latest version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name* `
    #
    # - Invoke a specific version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*version-number* `
    #
    # - Invoke a function by using an alias Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*alias-name* `
    #
    # **Systems Manager actions:**
    #
    # `arn:aws:ssm:*region*:*account-id*:opsitem:*severity* `
    @[JSON::Field(key: "AlarmActions")]
    property alarm_actions : Array(String) | Nil

    # The actions to execute when this alarm transitions to the `INSUFFICIENT_DATA` state from any
    # other state. Each action is specified as an Amazon Resource Name (ARN).
    #
    # Valid Values:
    #
    # **Amazon SNS actions:**
    #
    # `arn:aws:sns:*region*:*account-id*:*sns-topic-name* `
    #
    # **Lambda actions:**
    #
    # - Invoke the latest version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name* `
    #
    # - Invoke a specific version of a Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*version-number* `
    #
    # - Invoke a function by using an alias Lambda function:
    # `arn:aws:lambda:*region*:*account-id*:function:*function-name*:*alias-name* `
    @[JSON::Field(key: "InsufficientDataActions")]
    property insufficient_data_actions : Array(String) | Nil

    # The number of most recent scheduled query results to evaluate against the threshold (the N in
    # M-of-N evaluation). Valid range is 1 through 100.
    @[JSON::Field(key: "QueryResultsToEvaluate")]
    property query_results_to_evaluate : Int32

    # The number of query results, out of the most recent `QueryResultsToEvaluate` results, that must
    # breach the threshold to trigger the alarm to transition to `ALARM` (the M in M-of-N evaluation).
    # Must be less than or equal to `QueryResultsToEvaluate`.
    @[JSON::Field(key: "QueryResultsToAlarm")]
    property query_results_to_alarm : Int32

    # The value to compare with the aggregated query result.
    @[JSON::Field(key: "Threshold")]
    property threshold : Float64

    # The arithmetic operation to use when comparing the aggregated query result and the threshold.
    # The aggregated query result is used as the first operand. Valid values are
    # `GreaterThanThreshold`, `GreaterThanOrEqualToThreshold`, `LessThanThreshold`, and
    # `LessThanOrEqualToThreshold`.
    @[JSON::Field(key: "ComparisonOperator", converter: ACW::ComparisonOperator)]
    property comparison_operator : ComparisonOperator

    # Sets how this alarm is to handle missing data points. Valid values are `breaching`,
    # `notBreaching`, `ignore`, and `missing`. If this parameter is omitted, the default behavior of
    # `missing` is used.
    @[JSON::Field(key: "TreatMissingData")]
    property treat_missing_data : String | Nil

    # A list of key-value pairs to associate with the alarm. You can use tags to categorize and manage
    # your alarms.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # The warm-up configuration for the alarm. A warm-up period delays alarm evaluation after you
    # create or update the alarm. The warm-up period reduces alarm noise from missing data while a new
    # resource or service starts publishing data.
    #
    # For more information, see [Alarm warm-up
    # periods](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/alarm-warm-up.html) in
    # the *Amazon CloudWatch User Guide*.
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

    def_equals_and_hash(@alarm_name, @alarm_description, @scheduled_query_configuration, @action_log_line_count, @action_log_line_role_arn, @actions_enabled, @ok_actions, @alarm_actions, @insufficient_data_actions, @query_results_to_evaluate, @query_results_to_alarm, @threshold, @comparison_operator, @treat_missing_data, @tags, @warm_up_configuration)
  end
end
