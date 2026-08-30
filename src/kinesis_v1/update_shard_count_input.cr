private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
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
  end
end
