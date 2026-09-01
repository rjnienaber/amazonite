private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @start_event_time
        raise Core::ValidationError.new("startEventTime value must be >= 0") if value < 0
      end

      if value = @end_event_time
        raise Core::ValidationError.new("endEventTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@start_event_time, @end_event_time)
  end
end
