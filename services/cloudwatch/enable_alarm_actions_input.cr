private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class EnableAlarmActionsInput
    include JSON::Serializable

    # The names of the alarms.
    @[JSON::Field(key: "AlarmNames")]
    property alarm_names : Array(String) = [] of String

    def initialize(
      @alarm_names : Array(String),
    )
    end

    def validate! : Nil
      if value = @alarm_names
        raise Core::ValidationError.new("AlarmNames must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("AlarmNames must have at most 100 item(s)") if value.size > 100
      end
    end

    def_equals_and_hash(@alarm_names)
  end
end
