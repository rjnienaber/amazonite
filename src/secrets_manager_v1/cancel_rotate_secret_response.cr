private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("ARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ARN length must be <= 2048") if value.size > 2048
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 256") if value.size > 256
      end

      if value = @version_id
        raise Core::ValidationError.new("VersionId length must be >= 32") if value.size < 32
        raise Core::ValidationError.new("VersionId length must be <= 64") if value.size > 64
      end
    end

    def_equals_and_hash(@arn, @name, @version_id)
  end
end
