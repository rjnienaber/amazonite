module Amazonite::LambdaV1
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

    def_equals_and_hash(@next_attempt_delay_seconds)
  end
end
