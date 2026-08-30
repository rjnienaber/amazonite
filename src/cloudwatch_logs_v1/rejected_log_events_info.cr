module Amazonite::CloudWatchLogsV1
  # Represents the rejected events.
  class RejectedLogEventsInfo
    include JSON::Serializable

    # The index of the first log event that is too new. This field is inclusive.
    @[JSON::Field(key: "tooNewLogEventStartIndex")]
    property too_new_log_event_start_index : Int32 | Nil

    # The index of the last log event that is too old. This field is exclusive.
    @[JSON::Field(key: "tooOldLogEventEndIndex")]
    property too_old_log_event_end_index : Int32 | Nil

    # The expired log events.
    @[JSON::Field(key: "expiredLogEventEndIndex")]
    property expired_log_event_end_index : Int32 | Nil

    def initialize(
      @too_new_log_event_start_index : Int32 | Nil = nil,
      @too_old_log_event_end_index : Int32 | Nil = nil,
      @expired_log_event_end_index : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@too_new_log_event_start_index, @too_old_log_event_end_index, @expired_log_event_end_index)
  end
end
