private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class GetResourcePolicyInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the DynamoDB resource to which the policy is attached. The
    # resources you can specify include tables and streams.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    def initialize(
      @resource_arn : String,
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceArn length must be <= 1283") if value.size > 1283
      end
    end

    def_equals_and_hash(@resource_arn)
  end
end
