private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class CreateSecretRequest
    include JSON::Serializable

    # The name of the new secret.
    #
    # The secret name can contain ASCII letters, numbers, and the following characters: /_+=.@-
    #
    # Do not end your secret name with a hyphen followed by six characters. If you do so, you risk
    # confusion and unexpected results when searching for a secret by partial ARN. Secrets Manager
    # automatically adds a hyphen and six random characters after the secret name at the end of the
    # ARN.
    @[JSON::Field(key: "Name")]
    property name : String

    # If you include `SecretString` or `SecretBinary`, then Secrets Manager creates an initial version
    # for the secret, and this parameter specifies the unique identifier for the new version.
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
    #
    # - If the `ClientRequestToken` value isn't already associated with a version of the secret then a
    # new version of the secret is created.
    #
    # - If a version with this value already exists and the version `SecretString` and `SecretBinary`
    # values are the same as those in the request, then the request is ignored.
    #
    # - If a version with this value already exists and that version's `SecretString` and
    # `SecretBinary` values are different from those in the request, then the request fails because
    # you cannot modify an existing version. Instead, use PutSecretValue to create a new version.
    #
    # This value becomes the `VersionId` of the new version.
    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    # The description of the secret.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN, key ID, or alias of the KMS key that Secrets Manager uses to encrypt the secret value
    # in the secret. An alias is always prefixed by `alias/`, for example `alias/aws/secretsmanager`.
    # For more information, see [About
    # aliases](https://docs.aws.amazon.com/kms/latest/developerguide/alias-about.html).
    #
    # To use a KMS key in a different account, use the key ARN or the alias ARN.
    #
    # If you don't specify this value, then Secrets Manager uses the key `aws/secretsmanager`. If that
    # key doesn't yet exist, then Secrets Manager creates it for you automatically the first time it
    # encrypts the secret value.
    #
    # If the secret is in a different Amazon Web Services account from the credentials calling the
    # API, then you can't use `aws/secretsmanager` to encrypt the secret, and you must create and use
    # a customer managed KMS key.
    @[JSON::Field(key: "KmsKeyId")]
    property kms_key_id : String | Nil

    # The binary data to encrypt and store in the new version of the secret. We recommend that you
    # store your binary data in a file and then pass the contents of the file as a parameter.
    #
    # Either `SecretString` or `SecretBinary` must have a value, but not both.
    #
    # This parameter is not available in the Secrets Manager console.
    #
    # Sensitive: This field contains sensitive information, so the service does not include it in
    # CloudTrail log entries. If you create your own log entries, you must also avoid logging the
    # information in this field.
    @[JSON::Field(key: "SecretBinary", converter: Core::Base64Converter)]
    property secret_binary : Bytes | Nil

    # The text data to encrypt and store in this new version of the secret. We recommend you use a
    # JSON structure of key/value pairs for your secret value.
    #
    # Either `SecretString` or `SecretBinary` must have a value, but not both.
    #
    # If you create a secret by using the Secrets Manager console then Secrets Manager puts the
    # protected secret text in only the `SecretString` parameter. The Secrets Manager console stores
    # the information as a JSON structure of key/value pairs that a Lambda rotation function can
    # parse.
    #
    # Sensitive: This field contains sensitive information, so the service does not include it in
    # CloudTrail log entries. If you create your own log entries, you must also avoid logging the
    # information in this field.
    @[JSON::Field(key: "SecretString")]
    property secret_string : String | Nil

    # A list of tags to attach to the secret. Each tag is a key and value pair of strings in a JSON
    # text string, for example:
    #
    # `[{"Key":"CostCenter","Value":"12345"},{"Key":"environment","Value":"production"}]`
    #
    # Secrets Manager tag key names are case sensitive. A tag with the key "ABC" is a different tag
    # from one with key "abc".
    #
    # If you check tags in permissions policies as part of your security strategy, then adding or
    # removing a tag can change permissions. If the completion of this operation would result in you
    # losing your permissions for this secret, then Secrets Manager blocks the operation and returns
    # an `Access Denied` error. For more information, see [Control access to secrets using
    # tags](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html#tag-secrets-abac)
    # and [Limit access to identities with tags that match secrets'
    # tags](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html#auth-and-access_tags2).
    #
    # For information about how to format a JSON parameter for the various command line tool
    # environments, see [Using JSON for
    # Parameters](https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json).
    # If your command-line tool or SDK requires quotation marks around the parameter, you should use
    # single quotes to avoid confusion with the double quotes required in the JSON text.
    #
    # For tag quotas and naming restrictions, see [Service quotas for
    # Tagging](https://docs.aws.amazon.com/general/latest/gr/arg.html#taged-reference-quotas) in the
    # *Amazon Web Services General Reference guide*.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # A list of Regions and KMS keys to replicate secrets.
    @[JSON::Field(key: "AddReplicaRegions")]
    property add_replica_regions : Array(ReplicaRegionType) | Nil

    # Specifies whether to overwrite a secret with the same name in the destination Region. By
    # default, secrets aren't overwritten.
    @[JSON::Field(key: "ForceOverwriteReplicaSecret")]
    property force_overwrite_replica_secret : Bool | Nil

    # The exact string that identifies the partner that holds the external secret. For more
    # information, see [Using Secrets Manager managed external
    # secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/managed-external-secrets.html).
    @[JSON::Field(key: "Type")]
    property type : String | Nil

    def initialize(
      @name : String,
      @client_request_token : String | Nil = nil,
      @description : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @secret_binary : Bytes | Nil = nil,
      @secret_string : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @add_replica_regions : Array(ReplicaRegionType) | Nil = nil,
      @force_overwrite_replica_secret : Bool | Nil = nil,
      @type : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 512") if value.size > 512
      end

      if value = @client_request_token
        raise Core::ValidationError.new("ClientRequestToken length must be >= 32") if value.size < 32
        raise Core::ValidationError.new("ClientRequestToken length must be <= 64") if value.size > 64
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 2048") if value.size > 2048
      end

      if value = @kms_key_id
        raise Core::ValidationError.new("KmsKeyId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KmsKeyId length must be <= 2048") if value.size > 2048
      end

      if value = @secret_binary
        raise Core::ValidationError.new("SecretBinary length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretBinary length must be <= 65536") if value.size > 65536
      end

      if value = @secret_string
        raise Core::ValidationError.new("SecretString length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretString length must be <= 65536") if value.size > 65536
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @add_replica_regions
        raise Core::ValidationError.new("AddReplicaRegions must have at least 1 item(s)") if value.size < 1
        value.each(&.validate!)
      end

      if value = @type
        raise Core::ValidationError.new("Type length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Type length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@name, @client_request_token, @description, @kms_key_id, @secret_binary, @secret_string, @tags, @add_replica_regions, @force_overwrite_replica_secret, @type)
  end
end
