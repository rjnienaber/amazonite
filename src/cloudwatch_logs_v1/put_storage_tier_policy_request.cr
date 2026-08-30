private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class PutStorageTierPolicyRequest
    include JSON::Serializable

    # The storage tier to set for the account. Use `INTELLIGENT_TIERING` to automatically optimize
    # storage costs by moving log data to the appropriate tier based on access frequency.
    @[JSON::Field(key: "storageTier", converter: ACWL::StorageTier)]
    property storage_tier : StorageTier

    def initialize(
      @storage_tier : StorageTier,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@storage_tier)
  end
end
