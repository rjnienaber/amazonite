module Amazonite::LambdaV1
  class RetryDetails
    include JSON::Serializable

    @[JSON::Field(key: "CurrentAttempt")]
    property current_attempt : Int32 | Nil

    @[JSON::Field(key: "NextAttemptDelaySeconds")]
    property next_attempt_delay_seconds : Int32 | Nil

    def initialize(
      @current_attempt : Int32 | Nil = nil,
      @next_attempt_delay_seconds : Int32 | Nil = nil,
    )
    end
  end
end
