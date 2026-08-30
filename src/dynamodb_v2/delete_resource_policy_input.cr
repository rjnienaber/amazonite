module Amazonite::DynamoDBV2
  class DeleteResourcePolicyInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the DynamoDB resource from which the policy will be removed.
    # The resources you can specify include tables and streams. If you remove the policy of a table,
    # it will also remove the permissions for the table's indexes defined in that policy document.
    # This is because index permissions are defined in the table's policy.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # A string value that you can use to conditionally delete your policy. When you provide an
    # expected revision ID, if the revision ID of the existing policy on the resource doesn't match or
    # if there's no policy attached to the resource, the request will fail and return a
    # `PolicyNotFoundException`.
    @[JSON::Field(key: "ExpectedRevisionId")]
    property expected_revision_id : String | Nil

    def initialize(
      @resource_arn : String,
      @expected_revision_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@resource_arn, @expected_revision_id)
  end
end
