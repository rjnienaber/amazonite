private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
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
  end
end
