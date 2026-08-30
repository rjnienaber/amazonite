private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the settings used to enable server-side encryption.
  class SSESpecification
    include JSON::Serializable

    # Indicates whether server-side encryption is done using an Amazon Web Services managed key or an
    # Amazon Web Services owned key. If enabled (true), server-side encryption type is set to `KMS`
    # and an Amazon Web Services managed key is used (KMS charges apply). If disabled (false) or not
    # specified, server-side encryption is set to Amazon Web Services owned key.
    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    # Server-side encryption type. The only supported value is:
    #
    # - `KMS` - Server-side encryption that uses Key Management Service. The key is stored in your
    # account and is managed by KMS (KMS charges apply).
    @[JSON::Field(key: "SSEType", converter: ADDB::SSEType)]
    property sse_type : SSEType | Nil

    # The KMS key that should be used for the KMS encryption. To specify a key, use its key ID, Amazon
    # Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this parameter
    # if the key is different from the default DynamoDB key `alias/aws/dynamodb`.
    @[JSON::Field(key: "KMSMasterKeyId")]
    property kms_master_key_id : String | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
      @sse_type : SSEType | Nil = nil,
      @kms_master_key_id : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled, @sse_type, @kms_master_key_id)
  end
end
