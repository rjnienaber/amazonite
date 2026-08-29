module Amazonite::LambdaV1
  class GetResourcePolicyResponse
    include JSON::Serializable

    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
