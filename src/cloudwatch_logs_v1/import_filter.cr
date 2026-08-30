module Amazonite::CloudWatchLogsV1
  # The filter criteria used for import tasks
  class ImportFilter
    include JSON::Serializable

    # The start of the time range for events to import, expressed as the number of milliseconds after
    # Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "startEventTime")]
    property start_event_time : Int64 | Nil

    # The end of the time range for events to import, expressed as the number of milliseconds after
    # Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "endEventTime")]
    property end_event_time : Int64 | Nil

    def initialize(
      @start_event_time : Int64 | Nil = nil,
      @end_event_time : Int64 | Nil = nil,
    )
    end
  end
end
