module Amazonite::CloudWatchLogsV1
  # Represents a log event, which is a record of activity that was recorded by the application or
  # resource being monitored.
  class InputLogEvent
    include JSON::Serializable

    # The time the event occurred, expressed as the number of milliseconds after `Jan 1, 1970 00:00:00
    # UTC`.
    @[JSON::Field(key: "timestamp")]
    property timestamp : Int64

    # The raw event message. Each log event can be no larger than 1 MB.
    @[JSON::Field(key: "message")]
    property message : String

    def initialize(
      @timestamp : Int64,
      @message : String,
    )
    end
  end
end
