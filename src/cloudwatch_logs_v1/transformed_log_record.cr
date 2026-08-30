private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # This structure contains information for one log event that has been processed by a log
  # transformer.
  class TransformedLogRecord
    include JSON::Serializable

    # The event number.
    @[JSON::Field(key: "eventNumber")]
    property event_number : Int64 | Nil

    # The original log event message before it was transformed.
    @[JSON::Field(key: "eventMessage")]
    property event_message : String | Nil

    # The log event message after being transformed.
    @[JSON::Field(key: "transformedEventMessage")]
    property transformed_event_message : String | Nil

    def initialize(
      @event_number : Int64 | Nil = nil,
      @event_message : String | Nil = nil,
      @transformed_event_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @event_message
        raise Core::ValidationError.new("eventMessage length must be >= 1") if value.size < 1
      end

      if value = @transformed_event_message
        raise Core::ValidationError.new("transformedEventMessage length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@event_number, @event_message, @transformed_event_message)
  end
end
