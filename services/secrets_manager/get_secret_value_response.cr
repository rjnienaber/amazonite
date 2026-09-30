private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class GetSecretValueResponse
    include JSON::Serializable

    # The ARN of the secret.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The friendly name of the secret.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The unique identifier of this version of the secret.
    @[JSON::Field(key: "VersionId")]
    property version_id : String | Nil

    # The decrypted secret value, if the secret value was originally provided as binary data in the
    # form of a byte array. When you retrieve a `SecretBinary` using the HTTP API, the Python SDK, or
    # the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is not encoded.
    #
    # If the secret was created by using the Secrets Manager console, or if the secret value was
    # originally provided as a string, then this field is omitted. The secret value appears in
    # `SecretString` instead.
    #
    # Sensitive: This field contains sensitive information, so the service does not include it in
    # CloudTrail log entries. If you create your own log entries, you must also avoid logging the
    # information in this field.
    @[JSON::Field(key: "SecretBinary", converter: Core::Base64Converter)]
    property secret_binary : Bytes | Nil

    # The decrypted secret value, if the secret value was originally provided as a string or through
    # the Secrets Manager console.
    #
    # If this secret was created by using the console, then Secrets Manager stores the information as
    # a JSON structure of key/value pairs.
    #
    # Sensitive: This field contains sensitive information, so the service does not include it in
    # CloudTrail log entries. If you create your own log entries, you must also avoid logging the
    # information in this field.
    @[JSON::Field(key: "SecretString")]
    property secret_string : String | Nil

    # A list of all of the staging labels currently attached to this version of the secret.
    @[JSON::Field(key: "VersionStages")]
    property version_stages : Array(String) | Nil

    # The date and time that this version of the secret was created. If you don't specify which
    # version in `VersionId` or `VersionStage`, then Secrets Manager uses the `AWSCURRENT` version.
    @[JSON::Field(key: "CreatedDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @version_id : String | Nil = nil,
      @secret_binary : Bytes | Nil = nil,
      @secret_string : String | Nil = nil,
      @version_stages : Array(String) | Nil = nil,
      @created_date : Time | Nil = nil,
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

      if value = @secret_binary
        raise Core::ValidationError.new("SecretBinary length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretBinary length must be <= 65536") if value.size > 65536
      end

      if value = @secret_string
        raise Core::ValidationError.new("SecretString length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretString length must be <= 65536") if value.size > 65536
      end

      if value = @version_stages
        raise Core::ValidationError.new("VersionStages must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("VersionStages must have at most 20 item(s)") if value.size > 20
      end
    end

    def_equals_and_hash(@arn, @name, @version_id, @secret_binary, @secret_string, @version_stages, @created_date)
  end
end
