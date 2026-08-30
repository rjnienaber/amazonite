private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # The unit of data of the Kinesis data stream, which is composed of a sequence number, a partition
  # key, and a data blob.
  class Record
    include JSON::Serializable

    # The unique identifier of the record within its shard.
    @[JSON::Field(key: "SequenceNumber")]
    property sequence_number : String

    # The approximate time that the record was inserted into the stream.
    @[JSON::Field(key: "ApproximateArrivalTimestamp", converter: Core::AWSEpochConverter)]
    property approximate_arrival_timestamp : Time | Nil

    # The data blob. The data in the blob is both opaque and immutable to Kinesis Data Streams, which
    # does not inspect, interpret, or change the data in the blob in any way. When the data blob (the
    # payload before base64-encoding) is added to the partition key size, the total size must not
    # exceed the maximum record size (10 MiB).
    @[JSON::Field(key: "Data", converter: Core::Base64Converter)]
    property data : Bytes

    # Identifies which shard in the stream the data record is assigned to.
    @[JSON::Field(key: "PartitionKey")]
    property partition_key : String

    # The encryption type used on the record. This parameter can be one of the following values:
    #
    # - `NONE`: Do not encrypt the records in the stream.
    #
    # - `KMS`: Use server-side encryption on the records in the stream using a customer-managed Amazon
    # Web Services KMS key.
    @[JSON::Field(key: "EncryptionType", converter: AK::EncryptionType)]
    property encryption_type : EncryptionType | Nil

    def initialize(
      @sequence_number : String,
      @data : Bytes,
      @partition_key : String,
      @approximate_arrival_timestamp : Time | Nil = nil,
      @encryption_type : EncryptionType | Nil = nil,
    )
    end
  end
end
