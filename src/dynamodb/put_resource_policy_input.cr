private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class PutResourcePolicyInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the DynamoDB resource to which the policy will be attached.
    # The resources you can specify include tables and streams.
    #
    # You can control index permissions using the base table's policy. To specify the same permission
    # level for your table and its indexes, you can provide both the table and index Amazon Resource
    # Name (ARN)s in the `Resource` field of a given `Statement` in your policy document.
    # Alternatively, to specify different permissions for your table, indexes, or both, you can define
    # multiple `Statement` fields in your policy document.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # An Amazon Web Services resource-based policy document in JSON format.
    #
    # - The maximum size supported for a resource-based policy document is 20 KB. DynamoDB counts
    # whitespaces when calculating the size of a policy against this limit.
    #
    # - Within a resource-based policy, if the action for a DynamoDB service-linked role (SLR) to
    # replicate data for a global table is denied, adding or deleting a replica will fail with an
    # error.
    #
    # For a full list of all considerations that apply while attaching a resource-based policy, see
    # [Resource-based policy
    # considerations](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/rbac-considerations.html).
    @[JSON::Field(key: "Policy")]
    property policy : String

    # A string value that you can use to conditionally update your policy. You can provide the
    # revision ID of your existing policy to make mutating requests against that policy.
    #
    # When you provide an expected revision ID, if the revision ID of the existing policy on the
    # resource doesn't match or if there's no policy attached to the resource, your request will be
    # rejected with a `PolicyNotFoundException`.
    #
    # To conditionally attach a policy when no policy exists for the resource, specify `NO_POLICY` for
    # the revision ID.
    @[JSON::Field(key: "ExpectedRevisionId")]
    property expected_revision_id : String | Nil

    # Set this parameter to `true` to confirm that you want to remove your permissions to change the
    # policy of this resource in the future.
    @[JSON::Field(key: "ConfirmRemoveSelfResourceAccess")]
    property confirm_remove_self_resource_access : Bool | Nil

    def initialize(
      @resource_arn : String,
      @policy : String,
      @expected_revision_id : String | Nil = nil,
      @confirm_remove_self_resource_access : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceArn length must be <= 1283") if value.size > 1283
      end

      if value = @expected_revision_id
        raise Core::ValidationError.new("ExpectedRevisionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExpectedRevisionId length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@resource_arn, @policy, @expected_revision_id, @confirm_remove_self_resource_access)
  end
end
