private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @policy
        raise Core::ValidationError.new("Policy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Policy length must be <= 131072") if value.size > 131072
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @policy_name
        raise Core::ValidationError.new("PolicyName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PolicyName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("PolicyName does not match the required pattern") unless value.matches?(Regex.new("^[\\w]+$"))
      end
    end

    def_equals_and_hash(@policy, @policy_name)
  end
end
