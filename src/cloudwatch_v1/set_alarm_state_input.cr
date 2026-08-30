private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class SetAlarmStateInput
    include JSON::Serializable

    # The name of the alarm.
    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String

    # The value of the state.
    @[JSON::Field(key: "StateValue", converter: ACW::StateValue)]
    property state_value : StateValue

    # The reason that this alarm is set to this specific state, in text format.
    @[JSON::Field(key: "StateReason")]
    property state_reason : String

    # The reason that this alarm is set to this specific state, in JSON format.
    #
    # For SNS or EC2 alarm actions, this is just informational. But for EC2 Auto Scaling or
    # application Auto Scaling alarm actions, the Auto Scaling policy uses the information in this
    # field to take the correct action.
    @[JSON::Field(key: "StateReasonData")]
    property state_reason_data : String | Nil

    def initialize(
      @alarm_name : String,
      @state_value : StateValue,
      @state_reason : String,
      @state_reason_data : String | Nil = nil,
    )
    end
  end
end
