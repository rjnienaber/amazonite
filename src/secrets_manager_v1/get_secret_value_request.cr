module Amazonite::SecretsManagerV1
  class GetSecretValueRequest
    include JSON::Serializable

    # The ARN or name of the secret to retrieve. To retrieve a secret from another account, you must
    # use an ARN.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The unique identifier of the version of the secret to retrieve. If you include both this
    # parameter and `VersionStage`, the two parameters must refer to the same secret version. If you
    # don't specify either a `VersionStage` or `VersionId`, then Secrets Manager returns the
    # `AWSCURRENT` version.
    #
    # This value is typically a [UUID-type](https://wikipedia.org/wiki/Universally_unique_identifier)
    # value with 32 hexadecimal digits.
    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    # The staging label of the version of the secret to retrieve.
    #
    # Secrets Manager uses staging labels to keep track of different versions during the rotation
    # process. If you include both this parameter and `VersionId`, the two parameters must refer to
    # the same secret version. If you don't specify either a `VersionStage` or `VersionId`, Secrets
    # Manager returns the `AWSCURRENT` version.
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
