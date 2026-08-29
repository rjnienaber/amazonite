module Amazonite::SecretsManagerV1
  class DeleteResourcePolicyResponse
    include JSON::Serializable

    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end
  end
end
