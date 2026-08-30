private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # The description of the server-side encryption status on the specified table.
  class SSEDescription
    include JSON::Serializable

    # Represents the current state of server-side encryption. The only supported values are:
    #
    # - `ENABLED` - Server-side encryption is enabled.
    #
    # - `UPDATING` - Server-side encryption is being updated.
    @[JSON::Field(key: "Status", converter: ADDB::SSEStatus)]
    property status : SSEStatus | Nil

    # Server-side encryption type. The only supported value is:
    #
    # - `KMS` - Server-side encryption that uses Key Management Service. The key is stored in your
    # account and is managed by KMS (KMS charges apply).
    @[JSON::Field(key: "SSEType", converter: ADDB::SSEType)]
    property sse_type : SSEType | Nil

    # The KMS key ARN used for the KMS encryption.
    @[JSON::Field(key: "KMSMasterKeyArn")]
    property kms_master_key_arn : String | Nil

    # Indicates the time, in UNIX epoch date format, when DynamoDB detected that the table's KMS key
    # was inaccessible. This attribute will automatically be cleared when DynamoDB detects that the
    # table's KMS key is accessible again. DynamoDB will initiate the table archival process when
    # table's KMS key remains inaccessible for more than seven days from this date.
    @[JSON::Field(key: "InaccessibleEncryptionDateTime", converter: Core::AWSEpochConverter)]
    property inaccessible_encryption_date_time : Time | Nil

    def initialize(
      @status : SSEStatus | Nil = nil,
      @sse_type : SSEType | Nil = nil,
      @kms_master_key_arn : String | Nil = nil,
      @inaccessible_encryption_date_time : Time | Nil = nil,
    )
    end
  end
end
