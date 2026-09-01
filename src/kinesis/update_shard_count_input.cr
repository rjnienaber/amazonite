private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class UpdateShardCountInput
    include JSON::Serializable

    # The name of the stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The new number of shards. This value has the following default limits. By default, you cannot do
    # the following:
    #
    # - Set this value to more than double your current shard count for a stream.
    #
    # - Set this value below half your current shard count for a stream.
    #
    # - Set this value to more than 10000 shards in a stream (the default limit for shard count per
    # stream is 10000 per account per region), unless you request a limit increase.
    #
    # - Scale a stream with more than 10000 shards down unless you set this value to less than 10000
    # shards.
    @[JSON::Field(key: "TargetShardCount")]
    property target_shard_count : Int32

    # The scaling type. Uniform scaling creates shards of equal size.
    @[JSON::Field(key: "ScalingType", converter: AK::ScalingType)]
    property scaling_type : ScalingType

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @target_shard_count : Int32,
      @scaling_type : ScalingType,
      @stream_name : String | Nil = nil,
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

      if value = @target_shard_count
        raise Core::ValidationError.new("TargetShardCount value must be >= 1") if value < 1
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

    def_equals_and_hash(@stream_name, @target_shard_count, @scaling_type, @stream_arn, @stream_id)
  end
end
