module Amazonite::KinesisV1
  # Represents the output for `ListStreams`.
  class ListStreamsOutput
    include JSON::Serializable

    # The names of the streams that are associated with the Amazon Web Services account making the
    # `ListStreams` request.
    @[JSON::Field(key: "StreamNames")]
    property stream_names : Array(String) = [] of String

    # If set to `true`, there are more streams available to list.
    @[JSON::Field(key: "HasMoreStreams")]
    property has_more_streams : Bool

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "StreamSummaries")]
    property stream_summaries : Array(StreamSummary) | Nil

    def initialize(
      @stream_names : Array(String),
      @has_more_streams : Bool,
      @next_token : String | Nil = nil,
      @stream_summaries : Array(StreamSummary) | Nil = nil,
    )
    end
  end
end
