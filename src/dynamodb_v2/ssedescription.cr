private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class SSEDescription
    include JSON::Serializable

    @[JSON::Field(key: "Status", converter: ADDB::SSEStatus)]
    property status : SSEStatus | Nil

    @[JSON::Field(key: "SSEType", converter: ADDB::SSEType)]
    property ssetype : SSEType | Nil

    @[JSON::Field(key: "KMSMasterKeyArn")]
    property kmsmaster_key_arn : String | Nil

    @[JSON::Field(key: "InaccessibleEncryptionDateTime", converter: AC::AWSEpochConverter)]
    property inaccessible_encryption_date_time : Time | Nil

    def initialize(
      @status : SSEStatus | Nil = nil,
      @ssetype : SSEType | Nil = nil,
      @kmsmaster_key_arn : String | Nil = nil,
      @inaccessible_encryption_date_time : Time | Nil = nil
    )
    end
  end
end