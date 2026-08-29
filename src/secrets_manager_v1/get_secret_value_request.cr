module Amazonite::SecretsManagerV1
  class GetSecretValueRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    @[JSON::Field(key: "VersionStage")]
    property version_stage : String | Nil

    def initialize(
      @secret_id : String,
      @version_id : String | Nil = nil,
      @version_stage : String | Nil = nil,
    )
    end
  end
end
