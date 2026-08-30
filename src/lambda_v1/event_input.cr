module Amazonite::LambdaV1
  # Input information for an event.
  class EventInput
    include JSON::Serializable

    # The input payload.
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

    def_equals_and_hash(@payload, @truncated)
  end
end
