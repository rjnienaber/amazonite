private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Represents the output for `PutRecord`.
  class PutRecordOutput
    include JSON::Serializable

    # The shard ID of the shard where the data record was placed.
    @[JSON::Field(key: "ShardId")]
    property shard_id : String

    # The sequence number identifier that was assigned to the put data record. The sequence number for
    # the record is unique across all records in the stream. A sequence number is the identifier
    # associated with every record put into the stream.
    @[JSON::Field(key: "SequenceNumber")]
    property sequence_number : String

    # The encryption type to use on the record. This parameter can be one of the following values:
    #
    # - `NONE`: Do not encrypt the records in the stream.
    #
    # - `KMS`: Use server-side encryption on the records in the stream using a customer-managed Amazon
    # Web Services KMS key.
    @[JSON::Field(key: "EncryptionType", converter: AK::EncryptionType)]
    property encryption_type : EncryptionType | Nil

    def initialize(
      @shard_id : String,
      @sequence_number : String,
      @encryption_type : EncryptionType | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @shard_id
        raise Core::ValidationError.new("ShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @sequence_number
        raise Core::ValidationError.new("SequenceNumber does not match the required pattern") unless value.matches?(Regex.new("^0|([1-9]\\d{0,128})$"))
      end
    end

    def_equals_and_hash(@shard_id, @sequence_number, @encryption_type)
  end
end
