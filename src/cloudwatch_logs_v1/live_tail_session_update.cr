module Amazonite::CloudWatchLogsV1
  # This object contains the log events and metadata for a Live Tail session.
  class LiveTailSessionUpdate
    include JSON::Serializable

    # This object contains the session metadata for a Live Tail session.
    @[JSON::Field(key: "sessionMetadata")]
    property session_metadata : LiveTailSessionMetadata | Nil

    # An array, where each member of the array includes the information for one log event in the Live
    # Tail session.
    #
    # A `sessionResults` array can include as many as 500 log events. If the number of log events
    # matching the request exceeds 500 per second, the log events are sampled down to 500 log events
    # to be included in each `sessionUpdate` structure.
    @[JSON::Field(key: "sessionResults")]
    property session_results : Array(LiveTailSessionLogEvent) | Nil

    def initialize(
      @session_metadata : LiveTailSessionMetadata | Nil = nil,
      @session_results : Array(LiveTailSessionLogEvent) | Nil = nil,
    )
    end

    def_equals_and_hash(@session_metadata, @session_results)
  end
end
