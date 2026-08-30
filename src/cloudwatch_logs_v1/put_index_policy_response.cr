module Amazonite::CloudWatchLogsV1
  class PutIndexPolicyResponse
    include JSON::Serializable

    # The index policy that you just created or updated.
    @[JSON::Field(key: "indexPolicy")]
    property index_policy : IndexPolicy | Nil

    def initialize(
      @index_policy : IndexPolicy | Nil = nil,
    )
    end

    def_equals_and_hash(@index_policy)
  end
end
