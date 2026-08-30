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
  end
end
