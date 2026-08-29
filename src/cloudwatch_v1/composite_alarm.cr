private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class CompositeAlarm
    include JSON::Serializable

    @[JSON::Field(key: "ActionsEnabled")]
    property actions_enabled : Bool | Nil

    @[JSON::Field(key: "AlarmActions")]
    property alarm_actions : Array(String) | Nil

    @[JSON::Field(key: "AlarmArn")]
    property alarm_arn : String | Nil

    @[JSON::Field(key: "AlarmConfigurationUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property alarm_configuration_updated_timestamp : Time | Nil

    @[JSON::Field(key: "AlarmDescription")]
    property alarm_description : String | Nil

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String | Nil

    @[JSON::Field(key: "AlarmRule")]
    property alarm_rule : String | Nil

    @[JSON::Field(key: "InsufficientDataActions")]
    property insufficient_data_actions : Array(String) | Nil

    @[JSON::Field(key: "OKActions")]
    property ok_actions : Array(String) | Nil

    @[JSON::Field(key: "StateReason")]
    property state_reason : String | Nil

    @[JSON::Field(key: "StateReasonData")]
    property state_reason_data : String | Nil

    @[JSON::Field(key: "StateUpdatedTimestamp", converter: Core::AWSEpochConverter)]
    property state_updated_timestamp : Time | Nil

    @[JSON::Field(key: "StateValue", converter: ACW::StateValue)]
    property state_value : StateValue | Nil

    @[JSON::Field(key: "StateTransitionedTimestamp", converter: Core::AWSEpochConverter)]
    property state_transitioned_timestamp : Time | Nil

    @[JSON::Field(key: "ActionsSuppressedBy", converter: ACW::ActionsSuppressedBy)]
    property actions_suppressed_by : ActionsSuppressedBy | Nil

    @[JSON::Field(key: "ActionsSuppressedReason")]
    property actions_suppressed_reason : String | Nil

    @[JSON::Field(key: "ActionsSuppressor")]
    property actions_suppressor : String | Nil

    @[JSON::Field(key: "ActionsSuppressorWaitPeriod")]
    property actions_suppressor_wait_period : Int32 | Nil

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
  end
end
