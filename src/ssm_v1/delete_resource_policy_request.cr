module Amazonite::SsmV1
  class DeleteResourcePolicyRequest
    include JSON::Serializable

    # Amazon Resource Name (ARN) of the resource to which the policies are attached.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # The policy ID.
    @[JSON::Field(key: "PolicyId")]
    property policy_id : String

    # ID of the current policy version. The hash helps to prevent multiple calls from attempting to
    # overwrite a policy.
    @[JSON::Field(key: "PolicyHash")]
    property policy_hash : String

    def initialize(
      @resource_arn : String,
      @policy_id : String,
      @policy_hash : String,
    )
    end

    def_equals_and_hash(@resource_arn, @policy_id, @policy_hash)
  end
end
