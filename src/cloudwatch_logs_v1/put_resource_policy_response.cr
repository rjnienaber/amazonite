module Amazonite::CloudWatchLogsV1
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

    def_equals_and_hash(@resource_policy, @revision_id)
  end
end
