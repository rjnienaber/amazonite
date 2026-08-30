module Amazonite::KinesisV1
  class UpdateShardCountOutput
    include JSON::Serializable

    # The name of the stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The current number of shards.
    @[JSON::Field(key: "CurrentShardCount")]
    property current_shard_count : Int32 | Nil

    # The updated number of shards.
    @[JSON::Field(key: "TargetShardCount")]
    property target_shard_count : Int32 | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @current_shard_count : Int32 | Nil = nil,
      @target_shard_count : Int32 | Nil = nil,
      @stream_arn : String | Nil = nil,
    )
    end
  end
end
