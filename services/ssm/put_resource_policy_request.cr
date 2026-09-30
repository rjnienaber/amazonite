private alias Core = Amazonite::Core

module Amazonite::Ssm
  class PutResourcePolicyRequest
    include JSON::Serializable

    # Amazon Resource Name (ARN) of the resource to which you want to attach a policy.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # A policy you want to associate with a resource.
    @[JSON::Field(key: "Policy")]
    property policy : String

    # The policy ID.
    @[JSON::Field(key: "PolicyId")]
    property policy_id : String | Nil

    # ID of the current policy version. The hash helps to prevent a situation where multiple users
    # attempt to overwrite a policy. You must provide this hash when updating or deleting a policy.
    @[JSON::Field(key: "PolicyHash")]
    property policy_hash : String | Nil

    def initialize(
      @resource_arn : String,
      @policy : String,
      @policy_id : String | Nil = nil,
      @policy_hash : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ResourceArn length must be <= 2048") if value.size > 2048
      end

      if value = @policy
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^(?!\\s*$).+$"))
      end
    end

    def_equals_and_hash(@resource_arn, @policy, @policy_id, @policy_hash)
  end
end
