private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class GetResourcePolicyOutput
    include JSON::Serializable

    # The resource-based policy document attached to the resource, which can be a table or stream, in
    # JSON format.
    @[JSON::Field(key: "Policy")]
    property policy : String | Nil

    # A unique string that represents the revision ID of the policy. If you're comparing revision IDs,
    # make sure to always use string comparison logic.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @policy : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @revision_id
        raise Core::ValidationError.new("RevisionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RevisionId length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@policy, @revision_id)
  end
end
