private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Error information for an event.
  class EventError
    include JSON::Serializable

    # The error payload.
    @[JSON::Field(key: "Payload")]
    property payload : ErrorObject | Nil

    # Indicates if the error payload was truncated due to size limits.
    @[JSON::Field(key: "Truncated")]
    property truncated : Bool | Nil

    def initialize(
      @payload : ErrorObject | Nil = nil,
      @truncated : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @payload
        value.validate!
      end
    end

    def_equals_and_hash(@payload, @truncated)
  end
end
