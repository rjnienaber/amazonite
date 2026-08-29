module Amazonite::SecretsManagerV1
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
  end
end
