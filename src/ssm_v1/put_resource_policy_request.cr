module Amazonite::SsmV1
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

    def_equals_and_hash(@resource_arn, @policy, @policy_id, @policy_hash)
  end
end
