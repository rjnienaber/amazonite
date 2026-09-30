private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class GetLogEventsResponse
    include JSON::Serializable

    # The events.
    @[JSON::Field(key: "events")]
    property events : Array(OutputLogEvent) | Nil

    # The token for the next set of items in the forward direction. The token expires after 24 hours.
    # If you have reached the end of the stream, it returns the same token you passed in.
    @[JSON::Field(key: "nextForwardToken")]
    property next_forward_token : String | Nil

    # The token for the next set of items in the backward direction. The token expires after 24 hours.
    # This token is not null. If you have reached the end of the stream, it returns the same token you
    # passed in.
    @[JSON::Field(key: "nextBackwardToken")]
    property next_backward_token : String | Nil

    def initialize(
      @events : Array(OutputLogEvent) | Nil = nil,
      @next_forward_token : String | Nil = nil,
      @next_backward_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @events
        value.each(&.validate!)
      end

      if value = @next_forward_token
        raise Core::ValidationError.new("nextForwardToken length must be >= 1") if value.size < 1
      end

      if value = @next_backward_token
        raise Core::ValidationError.new("nextBackwardToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@events, @next_forward_token, @next_backward_token)
  end
end
