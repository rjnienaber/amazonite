private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  class GetResourcePolicyResponse
    include JSON::Serializable

    # The ARN of the secret that the resource-based policy was retrieved for.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret that the resource-based policy was retrieved for.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # A JSON-formatted string that contains the permissions policy attached to the secret. For more
    # information about permissions policies, see [Authentication and access control for Secrets
    # Manager](https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html).
    @[JSON::Field(key: "ResourcePolicy")]
    property resource_policy : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @resource_policy : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @arn
        raise Core::ValidationError.new("ARN length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ARN length must be <= 2048") if value.size > 2048
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 512") if value.size > 512
      end

      if value = @resource_policy
        raise Core::ValidationError.new("ResourcePolicy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourcePolicy length must be <= 20480") if value.size > 20480
      end
    end

    def_equals_and_hash(@arn, @name, @resource_policy)
  end
end
