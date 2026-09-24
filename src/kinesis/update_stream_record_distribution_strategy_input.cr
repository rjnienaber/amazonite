private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class UpdateStreamRecordDistributionStrategyInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the stream to update.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # The record distribution strategy to apply to the stream. Specify one of the following values:
    #
    # - `AUTO` – Amazon Kinesis Data Streams distributes records evenly across shards and ignores any
    # partition key and `ExplicitHashKey` that producers supply.
    #
    # - `USER_PARTITION_KEY` – Producers must supply a partition key, which Amazon Kinesis Data
    # Streams uses to determine shard placement. This is the default.
    @[JSON::Field(key: "RecordDistributionStrategy", converter: AK::RecordDistributionStrategy)]
    property record_distribution_strategy : RecordDistributionStrategy

    def initialize(
      @stream_arn : String,
      @record_distribution_strategy : RecordDistributionStrategy,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
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

    def_equals_and_hash(@stream_arn, @stream_id, @record_distribution_strategy)
  end
end
