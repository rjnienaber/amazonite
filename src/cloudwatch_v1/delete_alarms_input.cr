module Amazonite::CloudWatchV1
  class DeleteAlarmsInput
    include JSON::Serializable

    # The alarms to be deleted. Do not enclose the alarm names in quote marks.
    @[JSON::Field(key: "AlarmNames")]
    property alarm_names : Array(String) = [] of String

    def initialize(
      @alarm_names : Array(String),
    )
    end

    def_equals_and_hash(@alarm_names)
  end
end
