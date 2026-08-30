private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # The details about a composite alarm.
  class CompositeAlarm
    include JSON::Serializable

    # Indicates whether actions should be executed during any changes to the alarm state.
    @[JSON::Field(key: "ActionsEnabled")]
    property actions_enabled : Bool | Nil

    # The actions to execute when this alarm transitions to the ALARM state from any other state. Each
    # action is specified as an Amazon Resource Name (ARN).
    @[JSON::Field(key: "AlarmActions")]
    property alarm_actions : Array(String) | Nil

    # The Amazon Resource Name (ARN) of the alarm.
    @[JSON::Field(key: "AlarmArn")]
    property alarm_arn : String | Nil

    # The time stamp of the last update to the alarm configuration.
    @[JSON::Field(key: "AlarmConfigurationUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property alarm_configuration_updated_timestamp : Time | Nil

    # The description of the alarm.
    @[JSON::Field(key: "AlarmDescription")]
    property alarm_description : String | Nil

    # The name of the alarm.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    # The rule that this alarm uses to evaluate its alarm state.
    @[JSON::Field(key: "AlarmRule")]
    property alarm_rule : String | Nil

    # The actions to execute when this alarm transitions to the INSUFFICIENT_DATA state from any other
    # state. Each action is specified as an Amazon Resource Name (ARN).
    @[JSON::Field(key: "InsufficientDataActions")]
    property insufficient_data_actions : Array(String) | Nil

    # The actions to execute when this alarm transitions to the OK state from any other state. Each
    # action is specified as an Amazon Resource Name (ARN).
    @[JSON::Field(key: "OKActions")]
    property ok_actions : Array(String) | Nil

    # An explanation for the alarm state, in text format.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    # An explanation for the alarm state, in JSON format.
    @[JSON::Field(key: "StateReasonData")]
    property state_reason_data : String | Nil

    # Tracks the timestamp of any state update, even if `StateValue` doesn't change.
    @[JSON::Field(key: "StateUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property state_updated_timestamp : Time | Nil

    # The state value for the alarm.
    @[JSON::Field(key: "StateValue", converter: ACW::StateValue)]
    property state_value : StateValue | Nil

    # The timestamp of the last change to the alarm's `StateValue`.
    @[JSON::Field(key: "StateTransitionedTimestamp", converter: Core::AWSEpochConverter)]
    property state_transitioned_timestamp : Time | Nil

    # When the value is `ALARM`, it means that the actions are suppressed because the suppressor alarm
    # is in `ALARM` When the value is `WaitPeriod`, it means that the actions are suppressed because
    # the composite alarm is waiting for the suppressor alarm to go into into the `ALARM` state. The
    # maximum waiting time is as specified in `ActionsSuppressorWaitPeriod`. After this time, the
    # composite alarm performs its actions. When the value is `ExtensionPeriod`, it means that the
    # actions are suppressed because the composite alarm is waiting after the suppressor alarm went
    # out of the `ALARM` state. The maximum waiting time is as specified in
    # `ActionsSuppressorExtensionPeriod`. After this time, the composite alarm performs its actions.
    @[JSON::Field(key: "ActionsSuppressedBy", converter: ACW::ActionsSuppressedBy)]
    property actions_suppressed_by : ActionsSuppressedBy | Nil

    # Captures the reason for action suppression.
    @[JSON::Field(key: "ActionsSuppressedReason")]
    property actions_suppressed_reason : String | Nil

    # Actions will be suppressed if the suppressor alarm is in the `ALARM` state. `ActionsSuppressor`
    # can be an AlarmName or an Amazon Resource Name (ARN) from an existing alarm.
    @[JSON::Field(key: "ActionsSuppressor")]
    property actions_suppressor : String | Nil

    # The maximum time in seconds that the composite alarm waits for the suppressor alarm to go into
    # the `ALARM` state. After this time, the composite alarm performs its actions.
    #
    # `WaitPeriod` is required only when `ActionsSuppressor` is specified.
    @[JSON::Field(key: "ActionsSuppressorWaitPeriod")]
    property actions_suppressor_wait_period : Int32 | Nil

    # The maximum time in seconds that the composite alarm waits after suppressor alarm goes out of
    # the `ALARM` state. After this time, the composite alarm performs its actions.
    #
    # `ExtensionPeriod` is required only when `ActionsSuppressor` is specified.
    @[JSON::Field(key: "ActionsSuppressorExtensionPeriod")]
    property actions_suppressor_extension_period : Int32 | Nil

    def initialize(
      @actions_enabled : Bool | Nil = nil,
      @alarm_actions : Array(String) | Nil = nil,
      @alarm_arn : String | Nil = nil,
      @alarm_configuration_updated_timestamp : Time | Nil = nil,
      @alarm_description : String | Nil = nil,
      @alarm_name : String | Nil = nil,
      @alarm_rule : String | Nil = nil,
      @insufficient_data_actions : Array(String) | Nil = nil,
      @ok_actions : Array(String) | Nil = nil,
      @state_reason : String | Nil = nil,
      @state_reason_data : String | Nil = nil,
      @state_updated_timestamp : Time | Nil = nil,
      @state_value : StateValue | Nil = nil,
      @state_transitioned_timestamp : Time | Nil = nil,
      @actions_suppressed_by : ActionsSuppressedBy | Nil = nil,
      @actions_suppressed_reason : String | Nil = nil,
      @actions_suppressor : String | Nil = nil,
      @actions_suppressor_wait_period : Int32 | Nil = nil,
      @actions_suppressor_extension_period : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@actions_enabled, @alarm_actions, @alarm_arn, @alarm_configuration_updated_timestamp, @alarm_description, @alarm_name, @alarm_rule, @insufficient_data_actions, @ok_actions, @state_reason, @state_reason_data, @state_updated_timestamp, @state_value, @state_transitioned_timestamp, @actions_suppressed_by, @actions_suppressed_reason, @actions_suppressor, @actions_suppressor_wait_period, @actions_suppressor_extension_period)
  end
end
