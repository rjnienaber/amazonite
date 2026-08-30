module Amazonite::LambdaV1
  class AddLayerVersionPermissionResponse
    include JSON::Serializable

    # The permission statement.
    @[JSON::Field(key: "Statement")]
    property statement : String | Nil

    # A unique identifier for the current revision of the policy.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    def initialize(
      @statement : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@statement, @revision_id)
  end
end
