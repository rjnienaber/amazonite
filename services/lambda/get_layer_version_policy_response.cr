module Amazonite::Lambda
  class GetLayerVersionPolicyResponse
    include JSON::Serializable

    # The policy document.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    # A unique identifier for the current revision of the policy.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@policy, @revision_id)
  end
end
