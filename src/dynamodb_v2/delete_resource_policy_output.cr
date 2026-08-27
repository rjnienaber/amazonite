module Amazonite::DynamoDBV2
  class DeleteResourcePolicyOutput
    include JSON::Serializable

    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @revision_id : String | Nil = nil,
    )
    end
  end
end
