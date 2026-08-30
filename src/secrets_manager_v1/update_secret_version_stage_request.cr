module Amazonite::SecretsManagerV1
  class UpdateSecretVersionStageRequest
    include JSON::Serializable

    # The ARN or the name of the secret with the version and staging labelsto modify.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The staging label to add to this version.
    @[JSON::Field(key: "VersionStage")]
    property version_stage : String

    # The ID of the version that the staging label is to be removed from. If the staging label you are
    # trying to attach to one version is already attached to a different version, then you must
    # include this parameter and specify the version that the label is to be removed from. If the
    # label is attached and you either do not specify this parameter, or the version ID does not
    # match, then the operation fails.
    @[JSON::Field(key: "RemoveFromVersionId")]
    property remove_from_version_id : String | Nil

    # The ID of the version to add the staging label to. To remove a label from a version, then do not
    # specify this parameter.
    #
    # If the staging label is already attached to a different version of the secret, then you must
    # also specify the `RemoveFromVersionId` parameter.
    @[JSON::Field(key: "MoveToVersionId")]
    property move_to_version_id : String | Nil

    def initialize(
      @secret_id : String,
      @version_stage : String,
      @remove_from_version_id : String | Nil = nil,
      @move_to_version_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@secret_id, @version_stage, @remove_from_version_id, @move_to_version_id)
  end
end
