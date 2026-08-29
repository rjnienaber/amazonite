module Amazonite::KmsV1
  class GetKeyPolicyResponse
    include JSON::Serializable

    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @policy_name : String | Nil = nil,
    )
    end
  end
end
