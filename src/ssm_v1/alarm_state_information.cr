private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  # The details about the state of your CloudWatch alarm.
  class AlarmStateInformation
    include JSON::Serializable

    # The name of your CloudWatch alarm.
    @[JSON::Field(key: "Name")]
    property name : String

    # The state of your CloudWatch alarm.
    @[JSON::Field(key: "State", converter: AS::ExternalAlarmState)]
    property state : ExternalAlarmState

    def initialize(
      @name : String,
      @state : ExternalAlarmState,
    )
    end
  end
end
