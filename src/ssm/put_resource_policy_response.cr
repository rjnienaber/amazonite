module Amazonite::Ssm
  class PutResourcePolicyResponse
    include JSON::Serializable

    # The policy ID. To update a policy, you must specify `PolicyId` and `PolicyHash`.
    @[JSON::Field(key: "PolicyId")]
    property policy_id : String | Nil

    # ID of the current policy version.
    @[JSON::Field(key: "PolicyHash")]
    property policy_hash : String | Nil

    def initialize(
      @policy_id : String | Nil = nil,
      @policy_hash : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@policy_id, @policy_hash)
  end
end
