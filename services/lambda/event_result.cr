private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Result information for an event.
  class EventResult
    include JSON::Serializable

    # The result payload.
    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    # Indicates if the error payload was truncated due to size limits.
    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @payload : String | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @payload
        raise Core::ValidationError.new("Payload length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Payload length must be <= 6291456") if value.size > 6291456
      end
    end

    def_equals_and_hash(@payload, @truncated)
  end
end
