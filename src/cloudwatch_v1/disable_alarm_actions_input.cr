module Amazonite::CloudWatchV1
  class DisableAlarmActionsInput
    include JSON::Serializable

    @[JSON::Field(key: "AlarmNames")]
    property alarm_names : Array(String) = [] of String

    def initialize(
      @alarm_names : Array(String),
    )
    end
  end
end
