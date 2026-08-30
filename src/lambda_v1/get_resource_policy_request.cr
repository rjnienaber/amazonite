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

    def_equals_and_hash(@resource_arn)
  end
end
