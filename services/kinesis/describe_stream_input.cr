private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents the input for `DescribeStream`.
  class DescribeStreamInput
    include JSON::Serializable

    # The name of the stream to describe.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The maximum number of shards to return in a single call. The default value is 100. If you
    # specify a value greater than 100, at most 100 results are returned.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The shard ID of the shard to start with.
    #
    # Specify this parameter to indicate that you want to describe the stream starting with the shard
    # whose ID immediately follows `ExclusiveStartShardId`.
    #
    # If you don't specify this parameter, the default behavior for `DescribeStream` is to describe
    # the stream starting with the first shard in the stream.
    @[JSON::Field(key: "ExclusiveStartShardId")]
    property exclusive_start_shard_id : String | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @exclusive_start_shard_id : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 10000") if value > 10000
      end

      if value = @exclusive_start_shard_id
        raise Core::ValidationError.new("ExclusiveStartShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExclusiveStartShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ExclusiveStartShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@stream_name, @limit, @exclusive_start_shard_id, @stream_arn, @stream_id)
  end
end
