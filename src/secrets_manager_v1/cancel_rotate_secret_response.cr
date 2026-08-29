module Amazonite::SecretsManagerV1
  class CancelRotateSecretResponse
    include JSON::Serializable

    # The ARN of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The unique identifier of the version of the secret created during the rotation. This version
    # might not be complete, and should be evaluated for possible deletion. We recommend that you
    # remove the `VersionStage` value `AWSPENDING` from this version so that Secrets Manager can
    # delete it. Failing to clean up a cancelled rotation can block you from starting future
    # rotations.
    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @version_id : String | Nil = nil,
    )
    end
  end
end
