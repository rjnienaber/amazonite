module Amazonite::KinesisV1
  # Represents the output for GetRecords.
  class GetRecordsOutput
    include JSON::Serializable

    # The data records retrieved from the shard.
    @[JSON::Field(key: "Records")]
    property records : Array(Record) = [] of Record

    # The next position in the shard from which to start sequentially reading data records. If set to
    # `null`, the shard has been closed and the requested iterator does not return any more data.
    @[JSON::Field(key: "NextShardIterator")]
    property next_shard_iterator : String | Nil

    # The number of milliseconds the GetRecords response is from the tip of the stream, indicating how
    # far behind current time the consumer is. A value of zero indicates that record processing is
    # caught up, and there are no new records to process at this moment.
    @[JSON::Field(key: "MillisBehindLatest")]
    property millis_behind_latest : Int64 | Nil

    # The list of the current shard's child shards, returned in the `GetRecords` API's response only
    # when the end of the current shard is reached.
    @[JSON::Field(key: "ChildShards")]
    property child_shards : Array(ChildShard) | Nil

    def initialize(
      @records : Array(Record),
      @next_shard_iterator : String | Nil = nil,
      @millis_behind_latest : Int64 | Nil = nil,
      @child_shards : Array(ChildShard) | Nil = nil,
    )
    end
  end
end
