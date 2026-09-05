private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ListChannelsOutput
    include JSON::Serializable

    # A list of channel summaries.
    @[JSON::Field(key: "ChannelSummaries")]
    property channel_summaries : Array(ChannelSummary) = [] of ChannelSummary

    # The pagination token to use in a subsequent call to retrieve the next page of results. This
    # value is `null` when there are no more results to return.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @channel_summaries : Array(ChannelSummary),
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @channel_summaries
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1048576") if value.size > 1048576
      end
    end

    def_equals_and_hash(@channel_summaries, @next_token)
  end
end
