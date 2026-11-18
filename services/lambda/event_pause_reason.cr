private alias Core = Amazonite::Core

module Amazonite::Lambda
  # The reason for pausing a durable execution, as recorded in the execution history.
  class EventPauseReason
    include JSON::Serializable

    # The reason that you provided when you paused the execution. This field is only present if you
    # set `IncludeExecutionData` to `true` in the request.
    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    # Specifies whether Lambda omitted the reason from the response because `IncludeExecutionData` is
    # `false`.
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
        raise Core::ValidationError.new("Payload length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@payload, @truncated)
  end
end
