module Amazonite::SecretsManagerV1
  class RotateSecretResponse
    include JSON::Serializable

    # The ARN of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The ID of the new version of the secret.
    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @version_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@arn, @name, @version_id)
  end
end
