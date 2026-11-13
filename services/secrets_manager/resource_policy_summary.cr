private alias Core = Amazonite::Core

module Amazonite::SecretsManager
  # A structure that contains details about a resource policy attached to a secret. It does not
  # contain the contents of the resource policy. To view the contents of the policy, use
  # [GetResourcePolicy](https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetResourcePolicy.html)
  # .
  class ResourcePolicySummary
    include JSON::Serializable

    # The name of the resource policy.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    def initialize(
      @policy_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z\\-\\_]+$"))
      end
    end

    def_equals_and_hash(@policy_name)
  end
end
