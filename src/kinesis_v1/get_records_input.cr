module Amazonite::KinesisV1
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
  end
end
