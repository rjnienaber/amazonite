module Amazonite::LambdaV1
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
  end
end
