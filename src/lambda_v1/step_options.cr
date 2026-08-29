module Amazonite::LambdaV1
  class StepOptions
    include JSON::Serializable

    @[JSON::Field(key: "NextAttemptDelaySeconds")]
    property next_attempt_delay_seconds : Int32 | Nil

    def initialize(
      @next_attempt_delay_seconds : Int32 | Nil = nil,
    )
    end
  end
end
