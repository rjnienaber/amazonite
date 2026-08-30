module Amazonite::DynamoDBV2
  class PutResourcePolicyOutput
    include JSON::Serializable

    # A unique string that represents the revision ID of the policy. If you're comparing revision IDs,
    # make sure to always use string comparison logic.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @revision_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@revision_id)
  end
end
