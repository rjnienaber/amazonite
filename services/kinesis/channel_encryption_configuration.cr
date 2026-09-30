private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Specifies the Amazon Web Services KMS key that Amazon Kinesis Data Streams uses to encrypt data
  # delivered to the channel's destination.
  class ChannelEncryptionConfiguration
    include JSON::Serializable

    # The encryption type. The only valid value is `KMS`.
    @[JSON::Field(key: "EncryptionType", converter: AK::ChannelEncryptionType)]
    property encryption_type : ChannelEncryptionType

    # The identifier of the customer managed Amazon Web Services KMS key. You cannot use the Amazon
    # Kinesis Data Streams service key (`aws/kinesis`).
    @[JSON::Field(key: "KeyId")]
    property key_id : String

    def initialize(
      @encryption_type : ChannelEncryptionType,
      @key_id : String,
    )
    end

    def validate! : Nil
      if value = @key_id
        raise Core::ValidationError.new("KeyId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("KeyId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@encryption_type, @key_id)
  end
end
