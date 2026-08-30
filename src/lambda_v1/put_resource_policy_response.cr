module Amazonite::LambdaV1
  class PutResourcePolicyResponse
    include JSON::Serializable

    # The resource-based policy that Lambda adds to the resource.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    # The revision ID of the policy that Lambda adds to your Lambda resource.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@policy, @revision_id)
  end
end
