private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class StepDetails
    include JSON::Serializable

    @[JSON::Field(key: "Attempt")]
    property attempt : Int32 | Nil

    @[JSON::Field(key: "NextAttemptTimestamp", converter: Core::AWSEpochConverter)]
    property next_attempt_timestamp : Time | Nil

    @[JSON::Field(key: "Result")]
    property result : String | Nil

    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @attempt : Int32 | Nil = nil,
      @next_attempt_timestamp : Time | Nil = nil,
      @result : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
    )
    end
  end
end
