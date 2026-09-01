private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents the input for GetRecords.
  class GetRecordsInput
    include JSON::Serializable

    # The position in the shard from which you want to start sequentially reading data records. A
    # shard iterator specifies this position using the sequence number of a data record in the shard.
    @[JSON::Field(key: "ShardIterator")]
    property shard_iterator : String

    # The maximum number of records to return. Specify a value of up to 10,000. If you specify a value
    # that is greater than 10,000, GetRecords throws `InvalidArgumentException`. The default value is
    # 10,000.
    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @shard_iterator : String,
      @limit : Int32 | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @shard_iterator
        raise Core::ValidationError.new("ShardIterator length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardIterator length must be <= 512") if value.size > 512
      end

      if value = @limit
        raise Core::ValidationError.new("Limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("Limit value must be <= 10000") if value > 10000
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

    def_equals_and_hash(@shard_iterator, @limit, @stream_arn, @stream_id)
  end
end
