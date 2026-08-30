module Amazonite::KinesisV1
  # After you call SubscribeToShard, Kinesis Data Streams sends events of this type over an HTTP/2
  # connection to your consumer.
  class SubscribeToShardEvent
    include JSON::Serializable

    @[JSON::Field(key: "Records")]
    property records : Array(Record) = [] of Record

    # Use this as `SequenceNumber` in the next call to SubscribeToShard, with `StartingPosition` set
    # to `AT_SEQUENCE_NUMBER` or `AFTER_SEQUENCE_NUMBER`. Use `ContinuationSequenceNumber` for
    # checkpointing because it captures your shard progress even when no data is written to the shard.
    @[JSON::Field(key: "ContinuationSequenceNumber")]
    property continuation_sequence_number : String

    # The number of milliseconds the read records are from the tip of the stream, indicating how far
    # behind current time the consumer is. A value of zero indicates that record processing is caught
    # up, and there are no new records to process at this moment.
    @[JSON::Field(key: "MillisBehindLatest")]
    property millis_behind_latest : Int64

    # The list of the child shards of the current shard, returned only at the end of the current
    # shard.
    @[JSON::Field(key: "ChildShards")]
    property child_shards : Array(ChildShard) | Nil

    def initialize(
      @records : Array(Record),
      @continuation_sequence_number : String,
      @millis_behind_latest : Int64,
      @child_shards : Array(ChildShard) | Nil = nil,
    )
    end
  end
end
