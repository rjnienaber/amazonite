private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class DeleteResourcePolicyRequest
    include JSON::Serializable

    # The ARN or name of the secret to delete the attached resource-based policy for.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    def initialize(
      @secret_id : String,
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@secret_id)
  end
end
