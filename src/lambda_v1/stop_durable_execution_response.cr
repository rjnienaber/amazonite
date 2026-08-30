private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class StopDurableExecutionResponse
    include JSON::Serializable

    # The timestamp when the execution was stopped (ISO 8601 format).
    @[JSON::Field(key: "StopTimestamp", converter: Core::AWSEpochConverter)]
    property stop_timestamp : Time

    def initialize(
      @stop_timestamp : Time,
    )
    end

    def_equals_and_hash(@stop_timestamp)
  end
end
