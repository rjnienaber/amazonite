module Amazonite::CloudWatchLogsV1
  class PutLogEventsResponse
    include JSON::Serializable

    # The next sequence token.
    #
    # This field has been deprecated.
    #
    # The sequence token is now ignored in `PutLogEvents` actions. `PutLogEvents` actions are always
    # accepted even if the sequence token is not valid. You can use parallel `PutLogEvents` actions on
    # the same log stream and you do not need to wait for the response of a previous `PutLogEvents`
    # action to obtain the `nextSequenceToken` value.
    @[JSON::Field(key: "nextSequenceToken")]
    property next_sequence_token : String | Nil

    # The rejected events.
    @[JSON::Field(key: "rejectedLogEventsInfo")]
    property rejected_log_events_info : RejectedLogEventsInfo | Nil

    # Information about why the entity is rejected when calling `PutLogEvents`. Only returned when the
    # entity is rejected.
    #
    # When the entity is rejected, the events may still be accepted.
    @[JSON::Field(key: "rejectedEntityInfo")]
    property rejected_entity_info : RejectedEntityInfo | Nil

    def initialize(
      @next_sequence_token : String | Nil = nil,
      @rejected_log_events_info : RejectedLogEventsInfo | Nil = nil,
      @rejected_entity_info : RejectedEntityInfo | Nil = nil,
    )
    end
  end
end
