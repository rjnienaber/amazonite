private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ResourceArn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ResourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_])+)?$"))
      end

      if value = @policy
        raise Core::ValidationError.new("Policy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Policy length must be <= 20480") if value.size > 20480
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]+$"))
      end

      if value = @revision_id
        raise Core::ValidationError.new("RevisionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("RevisionId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("RevisionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@resource_arn, @policy, @revision_id)
  end
end
