private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the output for `DescribeStream`.
  class DescribeStreamOutput
    include JSON::Serializable

    # The current status of the stream, the stream Amazon Resource Name (ARN), an array of shard
    # objects that comprise the stream, and whether there are more shards available.
    @[JSON::Field(key: "StreamDescription")]
    property stream_description : StreamDescription

    def initialize(
      @stream_description : StreamDescription,
    )
    end

    def validate! : Nil
      if value = @stream_description
        value.validate!
      end
    end

    def_equals_and_hash(@stream_description)
  end
end
