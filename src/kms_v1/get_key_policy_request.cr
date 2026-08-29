module Amazonite::KmsV1
  class GetKeyPolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    def initialize(
      @key_id : String,
      @policy_name : String | Nil = nil,
    )
    end
  end
end
