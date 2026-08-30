private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  # A structure that contains the details about a secret. It does not include the encrypted
  # `SecretString` and `SecretBinary` values. To get those values, use
  # [GetSecretValue](https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html)
  # .
  class SecretListEntry
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The friendly name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The exact string that identifies the third-party partner that holds the external secret. For
    # more information, see [Managed external secret
    # partners](https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html).
    @[JSON::Field(key: "Type")]
    property type : String | Nil

    # The user-provided description of the secret.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the KMS key that Secrets Manager uses to encrypt the secret value. If the secret is
    # encrypted with the Amazon Web Services managed key `aws/secretsmanager`, this field is omitted.
    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    # Indicates whether automatic, scheduled rotation is enabled for this secret.
    @[JSON::Field(key: "RotationEnabled")]
    property rotation_enabled : Bool | Nil

    # The ARN of an Amazon Web Services Lambda function invoked by Secrets Manager to rotate and
    # expire the secret either automatically per the schedule or manually by a call to [
    # `RotateSecret`
    # ](https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_RotateSecret.html).
    @[JSON::Field(key: "RotationLambdaARN")]
    property rotation_lambda_arn : String | Nil

    # A structure that defines the rotation configuration for the secret.
    @[JSON::Field(key: "RotationRules")]
    property rotation_rules : RotationRulesType | Nil

    # The metadata needed to successfully rotate a managed external secret. A list of key value pairs
    # in JSON format specified by the partner. For more information about the required information,
    # see [Managed external secrets
    # partners](https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html).
    @[JSON::Field(key: "ExternalSecretRotationMetadata")]
    property external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil

    # The role that Secrets Manager assumes to call APIs required to perform the rotation. For more
    # information about the required information, see [Managed external secrets
    # partners](https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html).
    @[JSON::Field(key: "ExternalSecretRotationRoleArn")]
    property external_secret_rotation_role_arn : String | Nil

    # The most recent date and time that the Secrets Manager rotation process was successfully
    # completed. This value is null if the secret hasn't ever rotated.
    @[JSON::Field(key: "LastRotatedDate", converter: Core::AWSEpochConverter)]
    property last_rotated_date : Time | Nil

    # The last date and time that this secret was modified in any way.
    @[JSON::Field(key: "LastChangedDate", converter: Core::AWSEpochConverter)]
    property last_changed_date : Time | Nil

    # The date that the secret was last accessed in the Region. This field is omitted if the secret
    # has never been retrieved in the Region.
    @[JSON::Field(key: "LastAccessedDate", converter: Core::AWSEpochConverter)]
    property last_accessed_date : Time | Nil

    # The date and time the deletion of the secret occurred. Not present on active secrets. The secret
    # can be recovered until the number of days in the recovery window has passed, as specified in the
    # `RecoveryWindowInDays` parameter of the [ `DeleteSecret`
    # ](https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_DeleteSecret.html)
    # operation.
    @[JSON::Field(key: "DeletedDate", converter: Core::AWSEpochConverter)]
    property deleted_date : Time | Nil

    # The next rotation is scheduled to occur on or before this date. If the secret isn't configured
    # for rotation or rotation has been disabled, Secrets Manager returns null.
    @[JSON::Field(key: "NextRotationDate", converter: Core::AWSEpochConverter)]
    property next_rotation_date : Time | Nil

    # The list of user-defined tags associated with the secret. To add tags to a secret, use [
    # `TagResource`
    # ](https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_TagResource.html). To
    # remove tags, use [ `UntagResource`
    # ](https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_UntagResource.html).
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # A list of all of the currently assigned `SecretVersionStage` staging labels and the
    # `SecretVersionId` attached to each one. Staging labels are used to keep track of the different
    # versions during the rotation process.
    #
    # A version that does not have any `SecretVersionStage` is considered deprecated and subject to
    # deletion. Such versions are not included in this list.
    @[JSON::Field(key: "SecretVersionsToStages")]
    property secret_versions_to_stages : Hash(String, Array(String)) | Nil

    # Returns the name of the service that created the secret.
    @[JSON::Field(key: "OwningService")]
    property owning_service : String | Nil

    # The date and time when a secret was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The Region where Secrets Manager originated the secret.
    @[JSON::Field(key: "PrimaryRegion")]
    property primary_region : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @type : String | Nil = nil,
      @description : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @rotation_enabled : Bool | Nil = nil,
      @rotation_lambda_arn : String | Nil = nil,
      @rotation_rules : RotationRulesType | Nil = nil,
      @external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil = nil,
      @external_secret_rotation_role_arn : String | Nil = nil,
      @last_rotated_date : Time | Nil = nil,
      @last_changed_date : Time | Nil = nil,
      @last_accessed_date : Time | Nil = nil,
      @deleted_date : Time | Nil = nil,
      @next_rotation_date : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @secret_versions_to_stages : Hash(String, Array(String)) | Nil = nil,
      @owning_service : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @primary_region : String | Nil = nil,
    )
    end
  end
end
