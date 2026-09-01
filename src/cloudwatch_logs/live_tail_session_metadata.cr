module Amazonite::CloudWatchLogs
  # This object contains the metadata for one `LiveTailSessionUpdate` structure. It indicates
  # whether that update includes only a sample of 500 log events out of a larger number of ingested
  # log events, or if it contains all of the matching log events ingested during that second of
  # time.
  class LiveTailSessionMetadata
    include JSON::Serializable

    # If this is `true`, then more than 500 log events matched the request for this update, and the
    # `sessionResults` includes a sample of 500 of those events.
    #
    # If this is `false`, then 500 or fewer log events matched the request for this update, so no
    # sampling was necessary. In this case, the `sessionResults` array includes all log events that
    # matched your request during this time.
    @[JSON::Field(key: "sampled")]
    property sampled : Bool | Nil

    def initialize(
      @sampled : Bool | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@sampled)
  end
end
