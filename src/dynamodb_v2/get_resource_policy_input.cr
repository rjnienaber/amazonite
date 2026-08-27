module Amazonite::DynamoDBV2
  class GetResourcePolicyInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    def initialize(
      @resource_arn : String,
    )
    end
  end
end
