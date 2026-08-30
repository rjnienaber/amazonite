private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class StopStreamEncryptionInput
    include JSON::Serializable

    # The name of the stream on which to stop encrypting records.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The encryption type. The only valid value is `KMS`.
    @[JSON::Field(key: "EncryptionType", converter: AK::EncryptionType)]
    property encryption_type : EncryptionType

    # The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value
    # can be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an
    # alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by
    # Kinesis Data Streams by specifying the alias `aws/kinesis`.
    #
    # - Key ARN example: `arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012`
    #
    # - Alias ARN example: `arn:aws:kms:us-east-1:123456789012:alias/MyAliasName`
    #
    # - Globally unique key ID example: `12345678-1234-1234-1234-123456789012`
    #
    # - Alias name example: `alias/MyAliasName`
    #
    # - Master key owned by Kinesis Data Streams: `alias/aws/kinesis`
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @encryption_type : EncryptionType,
      @key_id : String,
      @stream_name : String | Nil = nil,
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

      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
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

    def_equals_and_hash(@stream_name, @encryption_type, @key_id, @stream_arn, @stream_id)
  end
end
