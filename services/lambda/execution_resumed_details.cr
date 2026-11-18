private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Details about a [durable
  # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html) that resumed.
  # The event timestamp is when the execution resumed.
  class ExecutionResumedDetails
    include JSON::Serializable

    # The date and time when you requested the resume, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "ResumeRequestTimestamp", converter: Core::AWSEpochConverter)]
    property resume_request_timestamp : Time

    # The reason that you provided when you resumed the execution.
    @[JSON::Field(key: "Reason")]
    property reason : EventResumeReason | Nil

    def initialize(
      @resume_request_timestamp : Time,
      @reason : EventResumeReason | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @reason
        value.validate!
      end
    end

    def_equals_and_hash(@resume_request_timestamp, @reason)
  end
end
