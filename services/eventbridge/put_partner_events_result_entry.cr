private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # The result of an event entry the partner submitted in this request. If the event was
  # successfully submitted, the entry has the event ID in it. Otherwise, you can use the error code
  # and error message to identify the problem with the entry.
  class PutPartnerEventsResultEntry
    include JSON::Serializable

    # The ID of the event.
    @[JSON::Field(key: "EventId")]
    property event_id : String | Nil

    # The error code that indicates why the event submission failed.
    @[JSON::Field(key: "ErrorCode")]
    property error_code : String | Nil

    # The error message that explains why the event submission failed.
    @[JSON::Field(key: "ErrorMessage")]
    property error_message : String | Nil

    def initialize(
      @event_id : String | Nil = nil,
      @error_code : String | Nil = nil,
      @error_message : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @event_id
        raise Core::ValidationError.new("EventId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventId length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@event_id, @error_code, @error_message)
  end
end
