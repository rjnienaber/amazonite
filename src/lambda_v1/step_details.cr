private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a step operation.
  class StepDetails
    include JSON::Serializable

    # The current attempt number for this step.
    @[JSON::Field(key: "Attempt")]
    property attempt : Int32 | Nil

    # The date and time when the next attempt is scheduled, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD). Only populated when the
    # step is in a pending state.
    @[JSON::Field(key: "NextAttemptTimestamp", converter: Core::AWSEpochConverter)]
    property next_attempt_timestamp : Time | Nil

    # The JSON response payload from the step operation.
    @[JSON::Field(key: "Result")]
    property result : String | Nil

    # Details about the step failure.
    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    def initialize(
      @attempt : Int32 | Nil = nil,
      @next_attempt_timestamp : Time | Nil = nil,
      @result : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @attempt
        raise Core::ValidationError.new("Attempt value must be >= 0") if value < 0
      end

      if value = @result
        raise Core::ValidationError.new("Result length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Result length must be <= 6291456") if value.size > 6291456
      end

      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@attempt, @next_attempt_timestamp, @result, @error)
  end
end
