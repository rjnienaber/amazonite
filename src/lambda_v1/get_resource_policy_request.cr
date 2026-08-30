private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class GetResourcePolicyRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Lambda resource you want to retrieve the policy for. You
    # can use a qualified or an unqualified ARN. The value must be a complete ARN, and the operation
    # does not accept wildcard characters.
    @[JSON::Field(key: "ResourceArn", ignore: true)]
    property resource_arn : String = ""

    def initialize(
      @resource_arn : String,
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("ResourceArn length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("ResourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_])+)?$"))
      end
    end

    def_equals_and_hash(@resource_arn)
  end
end
