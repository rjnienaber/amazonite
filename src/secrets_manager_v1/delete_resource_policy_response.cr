module Amazonite::SecretsManagerV1
  class DeleteResourcePolicyResponse
    include JSON::Serializable

    # The ARN of the secret that the resource-based policy was deleted for.
    @[JSON::Field(key: "ARN")]
    property arn : String | Nil

    # The name of the secret that the resource-based policy was deleted for.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @arn : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@arn, @name)
  end
end
