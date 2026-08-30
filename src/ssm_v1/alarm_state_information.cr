private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end
    end

    def_equals_and_hash(@name, @state)
  end
end
