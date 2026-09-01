private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents the output for `PutRecords`.
  class PutRecordsRequestEntry
    include JSON::Serializable

    # The data blob to put into the record, which is base64-encoded when the blob is serialized. When
    # the data blob (the payload before base64-encoding) is added to the partition key size, the total
    # size must not exceed the maximum record size (10 MiB).
    @[JSON::Field(key: "Data", converter: Core::Base64Converter)]
    property data : Bytes

    # The hash value used to determine explicitly the shard that the data record is assigned to by
    # overriding the partition key hash.
    @[JSON::Field(key: "ExplicitHashKey")]
    property explicit_hash_key : String | Nil

    # Determines which shard in the stream the data record is assigned to. Partition keys are Unicode
    # strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams
    # uses the partition key as input to a hash function that maps the partition key and associated
    # data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to
    # 128-bit integer values and to map associated data records to shards. As a result of this hashing
    # mechanism, all data records with the same partition key map to the same shard within the stream.
    @[JSON::Field(key: "PartitionKey")]
    property partition_key : String

    def initialize(
      @data : Bytes,
      @partition_key : String,
      @explicit_hash_key : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @data
        raise Core::ValidationError.new("Data length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Data length must be <= 10485760") if value.size > 10485760
      end

      if value = @explicit_hash_key
        raise Core::ValidationError.new("ExplicitHashKey does not match the required pattern") unless value.matches?(Regex.new("^0|([1-9]\\d{0,38})$"))
      end

      if value = @partition_key
        raise Core::ValidationError.new("PartitionKey length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PartitionKey length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@data, @explicit_hash_key, @partition_key)
  end
end
