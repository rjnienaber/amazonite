module Amazonite::KmsV1
  class ReplicateKeyRequest
    include JSON::Serializable

    @[JSON::Field(key: "KeyId")]
    property key_id : String

    @[JSON::Field(key: "ReplicaRegion")]
    property replica_region : String

    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    @[JSON::Field(key: "BypassPolicyLockoutSafetyCheck")]
    property bypass_policy_lockout_safety_check : Bool | Nil

    @[JSON::Field(key: "Description")]
    property description : String | Nil

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    def initialize(
      @key_id : String,
      @replica_region : String,
      @policy : String | Nil = nil,
      @bypass_policy_lockout_safety_check : Bool | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end
  end
end
