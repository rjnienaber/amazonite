private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ResourceArn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ResourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_])+)?$"))
      end

      if value = @revision_id
        raise Core::ValidationError.new("RevisionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("RevisionId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("RevisionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@resource_arn, @revision_id)
  end
end
