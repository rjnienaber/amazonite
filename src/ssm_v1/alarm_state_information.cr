private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  class AlarmStateInformation
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "State", converter: AS::ExternalAlarmState)]
    property state : ExternalAlarmState

    def initialize(
      @name : String,
      @state : ExternalAlarmState
    )
    end
  end
end
