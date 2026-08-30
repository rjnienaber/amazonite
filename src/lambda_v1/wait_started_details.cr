private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Details about a wait operation that has started.
  class WaitStartedDetails
    include JSON::Serializable

    # The duration to wait, in seconds.
    @[JSON::Field(key: "Duration")]
    property duration : Int32

    # The date and time when the wait operation is scheduled to complete, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "ScheduledEndTimestamp", converter: Core::AWSEpochConverter)]
    property scheduled_end_timestamp : Time

    def initialize(
      @duration : Int32,
      @scheduled_end_timestamp : Time,
    )
    end

    def_equals_and_hash(@duration, @scheduled_end_timestamp)
  end
end
