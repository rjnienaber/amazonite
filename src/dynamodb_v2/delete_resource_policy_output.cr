private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @revision_id
        raise Core::ValidationError.new("RevisionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RevisionId length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@revision_id)
  end
end
