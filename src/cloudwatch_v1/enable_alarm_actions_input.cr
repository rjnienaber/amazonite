module Amazonite::CloudWatchV1
  class EnableAlarmActionsInput
    include JSON::Serializable

    # The names of the alarms.
    @[JSON::Field(key: "AlarmNames")]
    property alarm_names : Array(String) = [] of String

    def initialize(
      @alarm_names : Array(String),
    )
    end

    def_equals_and_hash(@alarm_names)
  end
end
