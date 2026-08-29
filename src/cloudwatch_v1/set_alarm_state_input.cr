private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  class SetAlarmStateInput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmName")]
    property alarm_name : String

    @[JSON::Field(key: "StateValue", converter: ACW::StateValue)]
    property state_value : StateValue

    @[JSON::Field(key: "StateReason")]
    property state_reason : String

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
