module Amazonite::KmsV1
  class PutKeyPolicyRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    @[JSON::Field(key: "Policy")]
    property policy : String

    @[JSON::Field(key: "BypassPolicyLockoutSafetyCheck")]
    property bypass_policy_lockout_safety_check : Bool | Nil

    def initialize(
      @key_id : String,
      @policy : String,
      @policy_name : String | Nil = nil,
      @bypass_policy_lockout_safety_check : Bool | Nil = nil,
    )
    end
  end
end
