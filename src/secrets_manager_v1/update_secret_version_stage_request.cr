module Amazonite::SecretsManagerV1
  class UpdateSecretVersionStageRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "VersionStage")]
    property version_stage : String

    @[JSON::Field(key: "RemoveFromVersionId")]
    property remove_from_version_id : String | Nil

    @[JSON::Field(key: "MoveToVersionId")]
    property move_to_version_id : String | Nil

    def initialize(
      @secret_id : String,
      @version_stage : String,
      @remove_from_version_id : String | Nil = nil,
      @move_to_version_id : String | Nil = nil,
    )
    end
  end
end
