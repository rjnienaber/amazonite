private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class ValidateResourcePolicyRequest
    include JSON::Serializable

    # The ARN or name of the secret with the resource-based policy you want to validate.
    @[JSON::Field(key: "SecretId")]
    property secret_id : String | Nil

    # A JSON-formatted string that contains an Amazon Web Services resource-based policy. The policy
    # in the string identifies who can access or manage this secret and its versions. For example
    # policies, see [Permissions policy
    # examples](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html).
    @[JSON::Field(key: "ResourcePolicy")]
    property resource_policy : String

    def initialize(
      @resource_policy : String,
      @secret_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @secret_id
        raise Core::ValidationError.new("SecretId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SecretId length must be <= 2048") if value.size > 2048
      end

      if value = @resource_policy
        raise Core::ValidationError.new("ResourcePolicy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourcePolicy length must be <= 20480") if value.size > 20480
      end
    end

    def_equals_and_hash(@secret_id, @resource_policy)
  end
end
