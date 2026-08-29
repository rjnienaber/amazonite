module Amazonite::DynamoDBV2
  class DeleteResourcePolicyOutput
    include JSON::Serializable

    # A unique string that represents the revision ID of the policy. If you're comparing revision IDs,
    # make sure to always use string comparison logic.
    #
    # This value will be empty if you make a request against a resource without a policy.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @revision_id : String | Nil = nil,
    )
    end
  end
end
