module Amazonite::LambdaV1
  class GetResourcePolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "ResourceArn", ignore: true)]
    property resource_arn : String = ""

    def initialize(
      @resource_arn : String,
    )
    end
  end
end
