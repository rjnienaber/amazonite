private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class WaitDetails
    include JSON::Serializable

    @[JSON::Field(key: "ScheduledEndTimestamp", converter: Core::AWSEpochConverter)]
    property scheduled_end_timestamp : Time | Nil

    def initialize(
      @scheduled_end_timestamp : Time | Nil = nil,
    )
    end
  end
end
