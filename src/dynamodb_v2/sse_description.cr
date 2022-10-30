private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class SSEDescription
    include JSON::Serializable

    @[JSON::Field(key: "Status", converter: ADDB::SSEStatus)]
    property status : SSEStatus | Nil

    @[JSON::Field(key: "SSEType", converter: ADDB::SSEType)]
    property sse_type : SSEType | Nil

    @[JSON::Field(key: "KMSMasterKeyArn")]
    property kms_master_key_arn : String | Nil

    @[JSON::Field(key: "InaccessibleEncryptionDateTime", converter: Core::AWSEpochConverter)]
    property inaccessible_encryption_date_time : Time | Nil

    def initialize(
      @status : SSEStatus | Nil = nil,
      @sse_type : SSEType | Nil = nil,
      @kms_master_key_arn : String | Nil = nil,
      @inaccessible_encryption_date_time : Time | Nil = nil
    )
    end
  end
end
