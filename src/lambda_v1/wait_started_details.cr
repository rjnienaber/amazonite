private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class WaitStartedDetails
    include JSON::Serializable

    @[JSON::Field(key: "Duration")]
    property duration : Int32

    @[JSON::Field(key: "ScheduledEndTimestamp", converter: Core::AWSEpochConverter)]
    property scheduled_end_timestamp : Time

    def initialize(
      @duration : Int32,
      @scheduled_end_timestamp : Time,
    )
    end
  end
end
