module Amazonite::LambdaV1
  # Information about retry attempts for an operation.
  class RetryDetails
    include JSON::Serializable

    # The current attempt number for this operation.
    @[JSON::Field(key: "CurrentAttempt")]
    property current_attempt : Int32 | Nil

    # The delay before the next retry attempt, in seconds.
    @[JSON::Field(key: "NextAttemptDelaySeconds")]
    property next_attempt_delay_seconds : Int32 | Nil

    def initialize(
      @current_attempt : Int32 | Nil = nil,
      @next_attempt_delay_seconds : Int32 | Nil = nil,
    )
    end
  end
end
