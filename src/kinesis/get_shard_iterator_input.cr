private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents the input for `GetShardIterator`.
  class GetShardIteratorInput
    include JSON::Serializable

    # The name of the Amazon Kinesis data stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The shard ID of the Kinesis Data Streams shard to get the iterator for.
    @[JSON::Field(key: "ShardId")]
    property shard_id : String

    # Determines how the shard iterator is used to start reading data records from the shard.
    #
    # The following are the valid Amazon Kinesis shard iterator types:
    #
    # - AT_SEQUENCE_NUMBER - Start reading from the position denoted by a specific sequence number,
    # provided in the value `StartingSequenceNumber`.
    #
    # - AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted by a specific sequence
    # number, provided in the value `StartingSequenceNumber`.
    #
    # - AT_TIMESTAMP - Start reading from the position denoted by a specific time stamp, provided in
    # the value `Timestamp`.
    #
    # - TRIM_HORIZON - Start reading at the last untrimmed record in the shard in the system, which is
    # the oldest data record in the shard.
    #
    # - LATEST - Start reading just after the most recent record in the shard, so that you always read
    # the most recent data in the shard.
    @[JSON::Field(key: "ShardIteratorType", converter: AK::ShardIteratorType)]
    property shard_iterator_type : ShardIteratorType

    # The sequence number of the data record in the shard from which to start reading. Used with shard
    # iterator type AT_SEQUENCE_NUMBER and AFTER_SEQUENCE_NUMBER.
    @[JSON::Field(key: "StartingSequenceNumber")]
    property starting_sequence_number : String | Nil

    # The time stamp of the data record from which to start reading. Used with shard iterator type
    # AT_TIMESTAMP. A time stamp is the Unix epoch date with precision in milliseconds. For example,
    # `2016-04-04T19:58:46.480-00:00` or `1459799926.480`. If a record with this exact time stamp does
    # not exist, the iterator returned is for the next (later) record. If the time stamp is older than
    # the current trim horizon, the iterator returned is for the oldest untrimmed data record
    # (TRIM_HORIZON).
    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @shard_id : String,
      @shard_iterator_type : ShardIteratorType,
      @stream_name : String | Nil = nil,
      @starting_sequence_number : String | Nil = nil,
      @timestamp : Time | Nil = nil,
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

      if value = @shard_id
        raise Core::ValidationError.new("ShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @starting_sequence_number
        raise Core::ValidationError.new("StartingSequenceNumber does not match the required pattern") unless value.matches?(Regex.new("^0|([1-9]\\d{0,128})$"))
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

    def_equals_and_hash(@stream_name, @shard_id, @shard_iterator_type, @starting_sequence_number, @timestamp, @stream_arn, @stream_id)
  end
end
