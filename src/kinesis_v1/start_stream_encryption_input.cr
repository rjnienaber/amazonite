private alias AK = Amazonite::KinesisV1

module Amazonite::KinesisV1
  class StartStreamEncryptionInput
    include JSON::Serializable

    # The name of the stream for which to start encrypting records.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The encryption type to use. The only valid value is `KMS`.
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
  end
end
