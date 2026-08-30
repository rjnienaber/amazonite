module Amazonite::LambdaV1
  class DeleteResourcePolicyRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Lambda resource you want to delete the policy from. You
    # can use a qualified or an unqualified ARN. The value must be a complete ARN, and the operation
    # does not accept wildcard characters.
    @[JSON::Field(key: "ResourceArn", ignore: true)]
    property resource_arn : String = ""

    # The revision ID that the existing policy must match for the deletion to proceed. If the revision
    # ID doesn't match, the operation fails with a `PreconditionFailedException` error. To retrieve
    # the current revision ID, use the GetResourcePolicy operation.
    @[JSON::Field(key: "RevisionId", ignore: true)]
    property revision_id : String | Nil

    def initialize(
      @resource_arn : String,
      @revision_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_arn, @revision_id)
  end
end
