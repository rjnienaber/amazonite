private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class SecretVersionsListEntry
    include JSON::Serializable

    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    @[JSON::Field(key: "VersionStages")]
    property version_stages : Array(String) | Nil

    @[JSON::Field(key: "LastAccessedDate", converter: Core::AWSEpochConverter)]
    property last_accessed_date : Time | Nil

    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    @[JSON::Field(key: "KmsKeyIds")]
    property kms_key_ids : Array(String) | Nil

    def initialize(
      @version_id : String | Nil = nil,
      @version_stages : Array(String) | Nil = nil,
      @last_accessed_date : Time | Nil = nil,
      @created_date : Time | Nil = nil,
      @kms_key_ids : Array(String) | Nil = nil,
    )
    end
  end
end
