private alias Core = Amazonite::Core

module Amazonite::Lambda
  # Details about a wait operation.
  class WaitDetails
    include JSON::Serializable

    # The date and time when the wait operation is scheduled to complete, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "ScheduledEndTimestamp", converter: Core::AWSEpochConverter)]
    property scheduled_end_timestamp : Time | Nil

    def initialize(
      @scheduled_end_timestamp : Time | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@scheduled_end_timestamp)
  end
end
