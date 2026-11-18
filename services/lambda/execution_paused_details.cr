private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Details about a [durable
  # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html) that paused. The
  # event timestamp is when the execution paused.
  class ExecutionPausedDetails
    include JSON::Serializable

    # The date and time when you requested the pause, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "PauseRequestTimestamp", converter: Core::AWSEpochConverter)]
    property pause_request_timestamp : Time

    # The reason that you provided when you paused the execution.
    @[JSON::Field(key: "Reason")]
    property reason : EventPauseReason | Nil

    # Specifies whether the pause also paused the execution timeout.
    @[JSON::Field(key: "ExecutionTimeoutPaused")]
    property execution_timeout_paused : Bool

    def initialize(
      @pause_request_timestamp : Time,
      @execution_timeout_paused : Bool,
      @reason : EventPauseReason | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @reason
        value.validate!
      end
    end

    def_equals_and_hash(@pause_request_timestamp, @reason, @execution_timeout_paused)
  end
end
