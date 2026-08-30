private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # Represents a matched event.
  class MetricFilterMatchRecord
    include JSON::Serializable

    # The event number.
    @[JSON::Field(key: "eventNumber")]
    property event_number : Int64 | Nil

    # The raw event data.
    @[JSON::Field(key: "eventMessage")]
    property event_message : String | Nil

    # The values extracted from the event data by the filter.
    @[JSON::Field(key: "extractedValues")]
    property extracted_values : Hash(String, String) | Nil

    def initialize(
      @event_number : Int64 | Nil = nil,
      @event_message : String | Nil = nil,
      @extracted_values : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @event_message
        raise Core::ValidationError.new("eventMessage length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@event_number, @event_message, @extracted_values)
  end
end
