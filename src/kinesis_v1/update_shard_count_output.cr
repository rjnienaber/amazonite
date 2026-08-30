private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @current_shard_count
        raise Core::ValidationError.new("CurrentShardCount value must be >= 1") if value < 1
      end

      if value = @target_shard_count
        raise Core::ValidationError.new("TargetShardCount value must be >= 1") if value < 1
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end
    end

    def_equals_and_hash(@stream_name, @current_shard_count, @target_shard_count, @stream_arn)
  end
end
