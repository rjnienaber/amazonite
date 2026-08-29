private alias ASM = Amazonite::SecretsManagerV1
private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class ReplicationStatusType
    include JSON::Serializable

    @[JSON::Field(key: "Region")]
    property region : String | Nil

    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    @[JSON::Field(key: "Status", converter: ASM::StatusType)]
    property status : StatusType | Nil

    @[JSON::Field(key: "StatusMessage")]
    property status_message : String | Nil

    @[JSON::Field(key: "LastAccessedDate", converter: Core::AWSEpochConverter)]
    property last_accessed_date : Time | Nil

    def initialize(
      @region : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @status : StatusType | Nil = nil,
      @status_message : String | Nil = nil,
      @last_accessed_date : Time | Nil = nil,
    )
    end
  end
end
