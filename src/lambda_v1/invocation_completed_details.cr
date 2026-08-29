private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class InvocationCompletedDetails
    include JSON::Serializable

    @[JSON::Field(key: "StartTimestamp", converter: Core::AWSEpochConverter)]
    property start_timestamp : Time

    @[JSON::Field(key: "EndTimestamp", converter: Core::AWSEpochConverter)]
    property end_timestamp : Time

    @[JSON::Field(key: "RequestId")]
    property request_id : String

    @[JSON::Field(key: "Error")]
    property error : EventError | Nil

    def initialize(
      @start_timestamp : Time,
      @end_timestamp : Time,
      @request_id : String,
      @error : EventError | Nil = nil,
    )
    end
  end
end
