private alias Core = Amazonite::Core

module Amazonite::Lambda
  class GetResourcePolicyResponse
    include JSON::Serializable

    # The resource-based policy attached to the Lambda resource you specified.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    # The revision ID of the policy. Pass this value as the `RevisionId` in a PutResourcePolicy or
    # DeleteResourcePolicy request. Doing so ensures the operation acts on the expected version of the
    # policy.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @policy
        raise Core::ValidationError.new("Policy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Policy length must be <= 20480") if value.size > 20480
        raise Core::ValidationError.new("Policy does not match the required pattern") unless value.matches?(Regex.new("^[\\s\\S]+$"))
      end

      if value = @revision_id
        raise Core::ValidationError.new("RevisionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("RevisionId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("RevisionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@policy, @revision_id)
  end
end
