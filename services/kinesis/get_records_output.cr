private alias Core = Amazonite::Core

module Amazonite::Kinesis
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

    def validate! : Nil
      if value = @records
        value.each(&.validate!)
      end

      if value = @next_shard_iterator
        raise Core::ValidationError.new("NextShardIterator length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextShardIterator length must be <= 512") if value.size > 512
      end

      if value = @millis_behind_latest
        raise Core::ValidationError.new("MillisBehindLatest value must be >= 0") if value < 0
      end

      if value = @child_shards
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@records, @next_shard_iterator, @millis_behind_latest, @child_shards)
  end
end
