private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Configuration options for a step operation.
  class StepOptions
    include JSON::Serializable

    # The delay in seconds before the next retry attempt.
    @[JSON::Field(key: "NextAttemptDelaySeconds")]
    property next_attempt_delay_seconds : Int32 | Nil

    def initialize(
      @next_attempt_delay_seconds : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @next_attempt_delay_seconds
        raise Core::ValidationError.new("NextAttemptDelaySeconds value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@next_attempt_delay_seconds)
  end
end
