module Amazonite::KmsV1
  class GetKeyPolicyResponse
    include JSON::Serializable

    # A key policy document in JSON format.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    # The name of the key policy. The only valid value is `default`.
    @[JSON::Field(key: "PolicyName")]
    property policy_name : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @policy_name : String | Nil = nil,
    )
    end

    def_equals_and_hash(@policy, @policy_name)
  end
end
