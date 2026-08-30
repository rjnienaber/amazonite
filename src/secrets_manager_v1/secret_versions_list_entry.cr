private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  # A structure that contains information about one version of a secret.
  class SecretVersionsListEntry
    include JSON::Serializable

    # The unique version identifier of this version of the secret.
    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    # An array of staging labels that are currently associated with this version of the secret.
    @[JSON::Field(key: "VersionStages")]
    property version_stages : Array(String) | Nil

    # The date that this version of the secret was last accessed. Note that the resolution of this
    # field is at the date level and does not include the time.
    @[JSON::Field(key: "LastAccessedDate", converter: Core::AWSEpochConverter)]
    property last_accessed_date : Time | Nil

    # The date and time this version of the secret was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The KMS keys used to encrypt the secret version.
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

    def_equals_and_hash(@version_id, @version_stages, @last_accessed_date, @created_date, @kms_key_ids)
  end
end
