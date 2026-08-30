private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a function invocation that completed.
  class InvocationCompletedDetails
    include JSON::Serializable

    # The date and time when the invocation started, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "StartTimestamp", converter: Core::AWSEpochConverter)]
    property start_timestamp : Time

    # The date and time when the invocation ended, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "EndTimestamp", converter: Core::AWSEpochConverter)]
    property end_timestamp : Time

    # The request ID for the invocation.
    @[JSON::Field(key: "RequestId")]
    property request_id : String

    # Details about the invocation failure.
    @[JSON::Field(key: "Error")]
    property error : EventError | Nil

    def initialize(
      @start_timestamp : Time,
      @end_timestamp : Time,
      @request_id : String,
      @error : EventError | Nil = nil,
    )
    end

    def_equals_and_hash(@start_timestamp, @end_timestamp, @request_id, @error)
  end
end
