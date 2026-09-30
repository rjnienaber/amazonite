private alias AS = Amazonite::Ssm
private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    # Specifies the intended outcome of the operation. Applies only to the `Document` resource type.
    # The operation ignores this parameter for other resource types. Optional. Defaults to
    # `RemoveSharing`.
    #
    # - `RemoveSharing` – Deletes the resource policy and removes sharing of the document.
    #
    # - `RollbackMigration` – Reverts the document to Custom sharing, preserving existing consumer
    # access, instead of removing the policy.
    @[JSON::Field(key: "DeletionMode", converter: AS::DeletionMode)]
    property deletion_mode : DeletionMode | Nil

    def initialize(
      @resource_arn : String,
      @policy_id : String,
      @policy_hash : String,
      @deletion_mode : DeletionMode | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ResourceArn length must be <= 2048") if value.size > 2048
      end
    end

    def_equals_and_hash(@resource_arn, @policy_id, @policy_hash, @deletion_mode)
  end
end
