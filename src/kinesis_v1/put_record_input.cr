private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # Represents the input for `PutRecord`.
  class PutRecordInput
    include JSON::Serializable

    # The name of the stream to put the data record into.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The data blob to put into the record, which is base64-encoded when the blob is serialized. When
    # the data blob (the payload before base64-encoding) is added to the partition key size, the total
    # size must not exceed the maximum record size (10 MiB).
    @[JSON::Field(key: "Data", converter: Core::Base64Converter)]
    property data : Bytes

    # Determines which shard in the stream the data record is assigned to. Partition keys are Unicode
    # strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams
    # uses the partition key as input to a hash function that maps the partition key and associated
    # data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to
    # 128-bit integer values and to map associated data records to shards. As a result of this hashing
    # mechanism, all data records with the same partition key map to the same shard within the stream.
    @[JSON::Field(key: "PartitionKey")]
    property partition_key : String

    # The hash value used to explicitly determine the shard the data record is assigned to by
    # overriding the partition key hash.
    @[JSON::Field(key: "ExplicitHashKey")]
    property explicit_hash_key : String | Nil

    # Guarantees strictly increasing sequence numbers, for puts from the same client and to the same
    # partition key. Usage: set the `SequenceNumberForOrdering` of record *n* to the sequence number
    # of record *n-1* (as returned in the result when putting record *n-1*). If this parameter is not
    # set, records are coarsely ordered based on arrival time.
    @[JSON::Field(key: "SequenceNumberForOrdering")]
    property sequence_number_for_ordering : String | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @data : Bytes,
      @partition_key : String,
      @stream_name : String | Nil = nil,
      @explicit_hash_key : String | Nil = nil,
      @sequence_number_for_ordering : String | Nil = nil,
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

      if value = @data
        raise Core::ValidationError.new("Data length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Data length must be <= 10485760") if value.size > 10485760
      end

      if value = @partition_key
        raise Core::ValidationError.new("PartitionKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PartitionKey length must be <= 256") if value.size > 256
      end

      if value = @explicit_hash_key
        raise Core::ValidationError.new("ExplicitHashKey does not match the required pattern") unless value.matches?(Regex.new("^0|([1-9]\\d{0,38})$"))
      end

      if value = @sequence_number_for_ordering
        raise Core::ValidationError.new("SequenceNumberForOrdering does not match the required pattern") unless value.matches?(Regex.new("^0|([1-9]\\d{0,128})$"))
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

    def_equals_and_hash(@stream_name, @data, @partition_key, @explicit_hash_key, @sequence_number_for_ordering, @stream_arn, @stream_id)
  end
end
