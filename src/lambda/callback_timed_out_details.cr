private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Contains details about a callback operation that timed out, including timeout duration and any
  # partial results.
  class CallbackTimedOutDetails
    include JSON::Serializable

    # Details about the callback timeout.
    @[JSON::Field(key: "Error")]
    property error : EventError

    def initialize(
      @error : EventError,
    )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@error)
  end
end
