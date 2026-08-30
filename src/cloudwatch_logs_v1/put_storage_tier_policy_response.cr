private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class PutStorageTierPolicyResponse
    include JSON::Serializable

    # The storage tier for the account.
    @[JSON::Field(key: "storageTier", converter: ACWL::StorageTier)]
    property storage_tier : StorageTier | Nil

    # The time when the storage tier policy was last updated, expressed as the number of milliseconds
    # after `January 1, 1970 00:00:00 UTC`.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    def initialize(
      @storage_tier : StorageTier | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
    )
    end
  end
end
