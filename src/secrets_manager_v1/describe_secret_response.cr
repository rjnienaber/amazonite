private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class DescribeSecretResponse
    include JSON::Serializable

    # The ARN of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The exact string that identifies the partner that holds the external secret. For more
    # information, see [Using Secrets Manager managed external
    # secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/managed-external-secrets.html).
    @[JSON::Field(key: "Type")]
    property type : String | Nil

    # The description of the secret.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The key ID or alias ARN of the KMS key that Secrets Manager uses to encrypt the secret value. If
    # the secret is encrypted with the Amazon Web Services managed key `aws/secretsmanager`, this
    # field is omitted. Secrets created using the console use an KMS key ID.
    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    # Specifies whether automatic rotation is turned on for this secret. If the secret has never been
    # configured for rotation, Secrets Manager returns null.
    #
    # To turn on rotation, use RotateSecret. To turn off rotation, use CancelRotateSecret.
    @[JSON::Field(key: "RotationEnabled")]
    property rotation_enabled : Bool | Nil

    # The ARN of the Lambda function that Secrets Manager invokes to rotate the secret.
    @[JSON::Field(key: "RotationLambdaARN")]
    property rotation_lambda_arn : String | Nil

    # The rotation schedule and Lambda function for this secret. If the secret previously had rotation
    # turned on, but it is now turned off, this field shows the previous rotation schedule and
    # rotation function. If the secret never had rotation turned on, this field is omitted.
    @[JSON::Field(key: "RotationRules")]
    property rotation_rules : RotationRulesType | Nil

    # The metadata needed to successfully rotate a managed external secret. A list of key value pairs
    # in JSON format specified by the partner. For more information about the required information,
    # see [Managed external secrets
    # partners](https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html).
    @[JSON::Field(key: "ExternalSecretRotationMetadata")]
    property external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil

    # The Amazon Resource Name (ARN) of the role that allows Secrets Manager to rotate a secret held
    # by a third-party partner. For more information, see [Security and
    # permissions](https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-security.html).
    @[JSON::Field(key: "ExternalSecretRotationRoleArn")]
    property external_secret_rotation_role_arn : String | Nil

    # The last date and time that Secrets Manager rotated the secret. If the secret isn't configured
    # for rotation or rotation has been disabled, Secrets Manager returns null.
    @[JSON::Field(key: "LastRotatedDate", converter: Core::AWSEpochConverter)]
    property last_rotated_date : Time | Nil

    # The last date and time that this secret was modified in any way.
    @[JSON::Field(key: "LastChangedDate", converter: Core::AWSEpochConverter)]
    property last_changed_date : Time | Nil

    # The date that the secret was last accessed in the Region. This field is omitted if the secret
    # has never been retrieved in the Region.
    @[JSON::Field(key: "LastAccessedDate", converter: Core::AWSEpochConverter)]
    property last_accessed_date : Time | Nil

    # The date the secret is scheduled for deletion. If it is not scheduled for deletion, this field
    # is omitted. When you delete a secret, Secrets Manager requires a recovery window of at least 7
    # days before deleting the secret. Some time after the deleted date, Secrets Manager deletes the
    # secret, including all of its versions.
    #
    # If a secret is scheduled for deletion, then its details, including the encrypted secret value,
    # is not accessible. To cancel a scheduled deletion and restore access to the secret, use
    # RestoreSecret.
    @[JSON::Field(key: "DeletedDate", converter: Core::AWSEpochConverter)]
    property deleted_date : Time | Nil

    # The next rotation is scheduled to occur on or before this date. If the secret isn't configured
    # for rotation or rotation has been disabled, Secrets Manager returns null. If rotation fails,
    # Secrets Manager retries the entire rotation process multiple times. If rotation is unsuccessful,
    # this date may be in the past.
    #
    # This date represents the latest date that rotation will occur, but it is not an approximate
    # rotation date. In some cases, for example if you turn off automatic rotation and then turn it
    # back on, the next rotation may occur much sooner than this date.
    @[JSON::Field(key: "NextRotationDate", converter: Core::AWSEpochConverter)]
    property next_rotation_date : Time | Nil

    # The list of tags attached to the secret. To add tags to a secret, use TagResource. To remove
    # tags, use UntagResource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # A list of the versions of the secret that have staging labels attached. Versions that don't have
    # staging labels are considered deprecated and Secrets Manager can delete them.
    #
    # Secrets Manager uses staging labels to indicate the status of a secret version during rotation.
    # The three staging labels for rotation are:
    #
    # - `AWSCURRENT`, which indicates the current version of the secret.
    #
    # - `AWSPENDING`, which indicates the version of the secret that contains new secret information
    # that will become the next current version when rotation finishes.
    #
    # During rotation, Secrets Manager creates an `AWSPENDING` version ID before creating the new
    # secret version. To check if a secret version exists, call GetSecretValue.
    #
    # - `AWSPREVIOUS`, which indicates the previous current version of the secret. You can use this as
    # the *last known good* version.
    #
    # For more information about rotation and staging labels, see [How rotation
    # works](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html).
    @[JSON::Field(key: "VersionIdsToStages")]
    property version_ids_to_stages : Hash(String, Array(String)) | Nil

    # The ID of the service that created this secret. For more information, see [Secrets managed by
    # other Amazon Web Services
    # services](https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html).
    @[JSON::Field(key: "OwningService")]
    property owning_service : String | Nil

    # The date the secret was created.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The Region the secret is in. If a secret is replicated to other Regions, the replicas are listed
    # in `ReplicationStatus`.
    @[JSON::Field(key: "PrimaryRegion")]
    property primary_region : String | Nil

    # A list of the replicas of this secret and their status:
    #
    # - `Failed`, which indicates that the replica was not created.
    #
    # - `InProgress`, which indicates that Secrets Manager is in the process of creating the replica.
    #
    # - `InSync`, which indicates that the replica was created.
    @[JSON::Field(key: "ReplicationStatus")]
    property replication_status : Array(ReplicationStatusType) | Nil

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
      @version_ids_to_stages : Hash(String, Array(String)) | Nil = nil,
      @owning_service : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @primary_region : String | Nil = nil,
      @replication_status : Array(ReplicationStatusType) | Nil = nil,
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

      if value = @type
        raise Core::ValidationError.new("Type length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Type length must be <= 256") if value.size > 256
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 2048") if value.size > 2048
      end

      if value = @kms_key_id
        raise Core::ValidationError.new("KmsKeyId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyId length must be <= 2048") if value.size > 2048
      end

      if value = @rotation_lambda_arn
        raise Core::ValidationError.new("RotationLambdaARN length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("RotationLambdaARN length must be <= 2048") if value.size > 2048
      end

      if value = @rotation_rules
        value.validate!
      end

      if value = @external_secret_rotation_metadata
        value.each(&.validate!)
      end

      if value = @external_secret_rotation_role_arn
        raise Core::ValidationError.new("ExternalSecretRotationRoleArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ExternalSecretRotationRoleArn length must be <= 2048") if value.size > 2048
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @owning_service
        raise Core::ValidationError.new("OwningService length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OwningService length must be <= 128") if value.size > 128
      end

      if value = @primary_region
        raise Core::ValidationError.new("PrimaryRegion length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PrimaryRegion length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("PrimaryRegion does not match the required pattern") unless value.matches?(Regex.new("^([a-z]+-)+\\d+$"))
      end

      if value = @replication_status
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@arn, @name, @type, @description, @kms_key_id, @rotation_enabled, @rotation_lambda_arn, @rotation_rules, @external_secret_rotation_metadata, @external_secret_rotation_role_arn, @last_rotated_date, @last_changed_date, @last_accessed_date, @deleted_date, @next_rotation_date, @tags, @version_ids_to_stages, @owning_service, @created_date, @primary_region, @replication_status)
  end
end
