private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class StopDurableExecutionResponse
    include JSON::Serializable

    @[JSON::Field(key: "StopTimestamp", converter: Core::AWSEpochConverter)]
    property stop_timestamp : Time

    def initialize(
      @stop_timestamp : Time,
    )
    end
  end
end
