private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class UntagResourceRequest
    include JSON::Serializable

    # The ARN or name of the secret.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # A list of tag key names to remove from the secret. You don't specify the value. Both the key and
    # its associated value are removed.
    #
    # This parameter requires a JSON text string argument.
    #
    # For storing multiple values, we recommend that you use a JSON text string argument and specify
    # key/value pairs. For more information, see [Specifying parameter values for the Amazon Web
    # Services CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters.html) in the
    # Amazon Web Services CLI User Guide.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @secret_id : String,
      @tag_keys : Array(String),
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@secret_id, @tag_keys)
  end
end
