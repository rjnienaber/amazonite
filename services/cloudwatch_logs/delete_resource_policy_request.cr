private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class DeleteResourcePolicyRequest
    include JSON::Serializable

    # The name of the policy to be revoked. This parameter is required.
    @[JSON::Field(key: "policyName")]
    property policy_name : String | Nil

    # The ARN of the CloudWatch Logs resource for which the resource policy needs to be deleted
    @[JSON::Field(key: "resourceArn")]
    property resource_arn : String | Nil

    # The expected revision ID of the resource policy. Required when deleting a resource-scoped policy
    # to prevent concurrent modifications.
    @[JSON::Field(key: "expectedRevisionId")]
    property expected_revision_id : String | Nil

    def initialize(
      @policy_name : String | Nil = nil,
      @resource_arn : String | Nil = nil,
      @expected_revision_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @expected_revision_id
        raise Core::ValidationError.new("expectedRevisionId length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@policy_name, @resource_arn, @expected_revision_id)
  end
end
