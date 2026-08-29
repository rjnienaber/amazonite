module Amazonite::SecretsManagerV1
  class GetResourcePolicyResponse
    include JSON::Serializable

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    @[JSON::Field(key: "ResourcePolicy")]
    property resource_policy : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
      @resource_policy : String | Nil = nil,
    )
    end
  end
end
