module Amazonite::SecretsManagerV1
  class UpdateSecretResponse
    include JSON::Serializable

    # The ARN of the secret that was updated.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret that was updated.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # If Secrets Manager created a new version of the secret during this operation, then `VersionId`
    # contains the unique identifier of the new version.
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
