private alias Core = Amazonite::Core

module Amazonite::SecretsManagerV1
  class UpdateSecretRequest
    include JSON::Serializable

    # The ARN or name of the secret.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # If you include `SecretString` or `SecretBinary`, then Secrets Manager creates a new version for
    # the secret, and this parameter specifies the unique identifier for the new version.
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

    # The description of the secret.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN, key ID, or alias of the KMS key that Secrets Manager uses to encrypt new secret
    # versions as well as any existing versions with the staging labels `AWSCURRENT`, `AWSPENDING`, or
    # `AWSPREVIOUS`. If you don't have `kms:Encrypt` permission to the new key, Secrets Manager does
    # not re-encrypt existing secret versions with the new key. For more information about versions
    # and staging labels, see [Concepts:
    # Version](https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version).
    #
    # A key alias is always prefixed by `alias/`, for example `alias/aws/secretsmanager`. For more
    # information, see [About
    # aliases](https://docs.aws.amazon.com/kms/latest/developerguide/alias-about.html).
    #
    # If you set this to an empty string, Secrets Manager uses the Amazon Web Services managed key
    # `aws/secretsmanager`. If this key doesn't already exist in your account, then Secrets Manager
    # creates it for you automatically. All users and roles in the Amazon Web Services account
    # automatically have access to use `aws/secretsmanager`. Creating `aws/secretsmanager` can result
    # in a one-time significant delay in returning the result.
    #
    # You can only use the Amazon Web Services managed key `aws/secretsmanager` if you call this
    # operation using credentials from the same Amazon Web Services account that owns the secret. If
    # the secret is in a different account, then you must use a customer managed key and provide the
    # ARN of that KMS key in this field. The user making the call must have permissions to both the
    # secret and the KMS key in their respective accounts.
    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    # The binary data to encrypt and store in the new version of the secret. We recommend that you
    # store your binary data in a file and then pass the contents of the file as a parameter.
    #
    # Either `SecretBinary` or `SecretString` must have a value, but not both.
    #
    # You can't access this parameter in the Secrets Manager console.
    #
    # Sensitive: This field contains sensitive information, so the service does not include it in
    # CloudTrail log entries. If you create your own log entries, you must also avoid logging the
    # information in this field.
    @[JSON::Field(key: "SecretBinary", converter: Core::Base64Converter)]
    property secret_binary : Bytes | Nil

    # The text data to encrypt and store in the new version of the secret. We recommend you use a JSON
    # structure of key/value pairs for your secret value.
    #
    # Either `SecretBinary` or `SecretString` must have a value, but not both.
    #
    # Sensitive: This field contains sensitive information, so the service does not include it in
    # CloudTrail log entries. If you create your own log entries, you must also avoid logging the
    # information in this field.
    @[JSON::Field(key: "SecretString")]
    property secret_string : String | Nil

    # The exact string that identifies the third-party partner that holds the external secret. For
    # more information, see [Managed external secret
    # partners](https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html).
    @[JSON::Field(key: "Type")]
    property type : String | Nil

    def initialize(
      @secret_id : String,
      @client_request_token : String | Nil = nil,
      @description : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @secret_binary : Bytes | Nil = nil,
      @secret_string : String | Nil = nil,
      @type : String | Nil = nil,
    )
    end
  end
end
