module Amazonite::SsmV1
  class PutResourcePolicyResponse
    include JSON::Serializable

    @[JSON::Field(key: "PolicyId")]
    property policy_id : String | Nil

    @[JSON::Field(key: "PolicyHash")]
    property policy_hash : String | Nil

    def initialize(
      @policy_id : String | Nil = nil,
      @policy_hash : String | Nil = nil,
    )
    end
  end
end
