module Amazonite::SecretsManagerV1
  class PutResourcePolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "SecretId")]
    property secret_id : String

    @[JSON::Field(key: "ResourcePolicy")]
    property resource_policy : String

    @[JSON::Field(key: "BlockPublicPolicy")]
    property block_public_policy : Bool | Nil

    def initialize(
      @secret_id : String,
      @resource_policy : String,
      @block_public_policy : Bool | Nil = nil,
    )
    end
  end
end
