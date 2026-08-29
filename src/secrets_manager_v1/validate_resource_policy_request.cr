module Amazonite::SecretsManagerV1
  class ValidateResourcePolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String | Nil

    @[JSON::Field(key: "ResourcePolicy")]
    property resource_policy : String

    def initialize(
      @resource_policy : String,
      @secret_id : String | Nil = nil,
    )
    end
  end
end
