module Amazonite::LambdaV1
  class PutResourcePolicyRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Lambda resource you want to add the policy to. You can use
    # a qualified or an unqualified ARN. The value must be a complete ARN, and the operation does not
    # accept wildcard characters.
    @[JSON::Field(key: "ResourceArn", ignore: true)]
    property resource_arn : String = ""

    # The policy document you want to add to your Lambda resource. This is formatted as a JSON string.
    #
    # For more information, see [Working with resource-based policies in
    # Lambda](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html) in the
    # *Lambda Developer Guide*.
    @[JSON::Field(key: "Policy")]
    property policy : String

    # The revision ID that the existing policy must match for the replacement to proceed. If the
    # revision ID doesn't match, the operation fails with a `PreconditionFailedException` error. To
    # retrieve the current revision ID, use the GetResourcePolicy operation.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @resource_arn : String,
      @policy : String,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
