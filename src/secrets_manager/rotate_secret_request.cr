private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class RotateSecretRequest
    include JSON::Serializable

    # The ARN or name of the secret to rotate.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # A unique identifier for the new version of the secret. You only need to specify this value if
    # you implement your own retry logic and you want to ensure that Secrets Manager doesn't attempt
    # to create a secret version twice.
    #
    # If you use the Amazon Web Services CLI or one of the Amazon Web Services SDKs to call this
    # operation, then you can leave this parameter empty. The CLI or SDK generates a random UUID for
    # you and includes it as the value for this parameter in the request.
    #
    # If you generate a raw HTTP request to the Secrets Manager service endpoint, then you must
    # generate a `ClientRequestToken` and include it in the request.
    #
    # This value helps ensure idempotency. Secrets Manager uses this value to prevent the accidental
    # creation of duplicate versions if there are failures and retries during a rotation. We recommend
    # that you generate a [UUID-type](https://wikipedia.org/wiki/Universally_unique_identifier) value
    # to ensure uniqueness of your versions within the specified secret.
    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    # For secrets that use a Lambda rotation function to rotate, the ARN of the Lambda rotation
    # function.
    #
    # For secrets that use *managed rotation*, omit this field. For more information, see [Managed
    # rotation](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_managed.html)
    # in the *Secrets Manager User Guide*.
    @[JSON::Field(key: "RotationLambdaARN")]
    property rotation_lambda_arn : String | Nil

    # A structure that defines the rotation configuration for this secret.
    #
    # When changing an existing rotation schedule and setting `RotateImmediately` to `false`:
    #
    # - If using `AutomaticallyAfterDays` or a `ScheduleExpression` with `rate()`, the previously
    # scheduled rotation might still occur.
    #
    # - To prevent unintended rotations, use a `ScheduleExpression` with `cron()` for granular control
    # over rotation windows.
    @[JSON::Field(key: "RotationRules")]
    property rotation_rules : RotationRulesType | Nil

    # The metadata needed to successfully rotate a managed external secret. A list of key value pairs
    # in JSON format specified by the partner. For more information about the required information,
    # see [Using Secrets Manager managed external
    # secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/managed-external-secrets.html)
    @[JSON::Field(key: "ExternalSecretRotationMetadata")]
    property external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil

    # The Amazon Resource Name (ARN) of the role that allows Secrets Manager to rotate a secret held
    # by a third-party partner. For more information, see [Security and
    # permissions](https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-security.html).
    @[JSON::Field(key: "ExternalSecretRotationRoleArn")]
    property external_secret_rotation_role_arn : String | Nil

    # Specifies whether to rotate the secret immediately or wait until the next scheduled rotation
    # window. The rotation schedule is defined in RotateSecretRequest$RotationRules.
    #
    # The default for `RotateImmediately` is `true`. If you don't specify this value, Secrets Manager
    # rotates the secret immediately.
    #
    # If you set `RotateImmediately` to `false`, Secrets Manager tests the rotation configuration by
    # running the [ `testSecret`
    # step](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html) of
    # the Lambda rotation function. This test creates an `AWSPENDING` version of the secret and then
    # removes it.
    #
    # When changing an existing rotation schedule and setting `RotateImmediately` to `false`:
    #
    # - If using `AutomaticallyAfterDays` or a `ScheduleExpression` with `rate()`, the previously
    # scheduled rotation might still occur.
    #
    # - To prevent unintended rotations, use a `ScheduleExpression` with `cron()` for granular control
    # over rotation windows.
    #
    # Rotation is an asynchronous process. For more information, see [How rotation
    # works](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html).
    @[JSON::Field(key: "RotateImmediately")]
    property rotate_immediately : Bool | Nil

    def initialize(
      @secret_id : String,
      @client_request_token : String | Nil = nil,
      @rotation_lambda_arn : String | Nil = nil,
      @rotation_rules : RotationRulesType | Nil = nil,
      @external_secret_rotation_metadata : Array(ExternalSecretRotationMetadataItem) | Nil = nil,
      @external_secret_rotation_role_arn : String | Nil = nil,
      @rotate_immediately : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end

      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 32") if value.size < 32
        raise Core::ValidationError.new("ClientRequestToken length must be <= 64") if value.size > 64
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
    end

    def_equals_and_hash(@secret_id, @client_request_token, @rotation_lambda_arn, @rotation_rules, @external_secret_rotation_metadata, @external_secret_rotation_role_arn, @rotate_immediately)
  end
end
