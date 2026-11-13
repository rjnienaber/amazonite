private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class GetResourcePolicyRequest
    include JSON::Serializable

    # The ARN or name of the secret to retrieve the attached resource-based policy for.
    #
    # For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See [Finding
    # a secret from a partial
    # ARN](https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen).
    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    # The name of the resource policy to retrieve. If you don't specify this field, Secrets Manager
    # uses `default`. If you specify a name other than `default` and no policy with that name exists,
    # the operation returns a `ResourceNotFoundException`.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    def initialize(
      @secret_id : String,
      @policy_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end

      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z\\-\\_]+$"))
      end
    end

    def_equals_and_hash(@secret_id, @policy_name)
  end
end
