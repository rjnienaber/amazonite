private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class PutResourcePolicyResponse
    include JSON::Serializable

    # The new policy.
    @[JSON::Field(key: "resourcePolicy")]
    property resource_policy : ResourcePolicy | Nil

    # The revision ID of the created or updated resource policy. Only returned for resource-scoped
    # policies.
    @[JSON::Field(key: "revisionId")]
    property revision_id : String | Nil

    def initialize(
      @resource_policy : ResourcePolicy | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @resource_policy
        value.validate!
      end

      if value = @revision_id
        raise Core::ValidationError.new("revisionId length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@resource_policy, @revision_id)
  end
end
