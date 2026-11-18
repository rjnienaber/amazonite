private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Details about a [durable
  # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html) that is pausing
  # or paused.
  class PauseDetails
    include JSON::Serializable

    # The date and time when you requested the pause, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "PauseRequestTimestamp", converter: Core::AWSEpochConverter)]
    property pause_request_timestamp : Time

    # The reason that you provided when you paused the execution. This field is only present if you
    # set `IncludeExecutionData` to `true` in the request.
    @[JSON::Field(key: "Reason")]
    property reason : String | Nil

    # Specifies whether the pause also pauses the execution timeout.
    @[JSON::Field(key: "ExecutionTimeoutPaused")]
    property execution_timeout_paused : Bool

    def initialize(
      @pause_request_timestamp : Time,
      @execution_timeout_paused : Bool,
      @reason : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @reason
        raise Core::ValidationError.new("Reason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Reason length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@pause_request_timestamp, @reason, @execution_timeout_paused)
  end
end
