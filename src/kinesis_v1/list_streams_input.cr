module Amazonite::KinesisV1
  # Represents the input for `ListStreams`.
  class ListStreamsInput
    include JSON::Serializable

    # The maximum number of streams to list. The default value is 100. If you specify a value greater
    # than 100, at most 100 results are returned.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The name of the stream to start the list with.
    @[JSON::Field(key: "ExclusiveStartStreamName")]
    property exclusive_start_stream_name : String | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @limit : Int32 | Nil = nil,
      @exclusive_start_stream_name : String | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
