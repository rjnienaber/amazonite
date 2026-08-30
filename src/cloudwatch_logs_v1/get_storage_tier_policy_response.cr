private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class GetStorageTierPolicyResponse
    include JSON::Serializable

    # The current storage tier for the account.
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

    def validate! : Nil
      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@storage_tier, @last_updated_time)
  end
end
