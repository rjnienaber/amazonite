private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @alarm_name
        raise Core::ValidationError.new("AlarmName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AlarmName length must be <= 255") if value.size > 255
      end

      if value = @state_reason
        raise Core::ValidationError.new("StateReason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReason length must be <= 1023") if value.size > 1023
      end

      if value = @state_reason_data
        raise Core::ValidationError.new("StateReasonData length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("StateReasonData length must be <= 4000") if value.size > 4000
      end
    end

    def_equals_and_hash(@alarm_name, @state_value, @state_reason, @state_reason_data)
  end
end
