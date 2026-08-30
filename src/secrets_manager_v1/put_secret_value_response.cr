module Amazonite::SecretsManagerV1
  class PutSecretValueResponse
    include JSON::Serializable

    # The ARN of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The unique identifier of the version of the secret.
    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    # The list of staging labels that are currently attached to this version of the secret. Secrets
    # Manager uses staging labels to track a version as it progresses through the secret rotation
    # process.
    @[JSON::Field(key: "VersionStages")]
    property version_stages : Array(String) | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @version_id : String | Nil = nil,
      @version_stages : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@arn, @name, @version_id, @version_stages)
  end
end
