module Amazonite::EventBridgeV1
  class PutTargetsResponse
    include JSON::Serializable

    # The number of failed entries.
    @[JSON::Field(key: "FailedEntryCount")]
    property failed_entry_count : Int32 | Nil

    # The failed target entries.
    @[JSON::Field(key: "FailedEntries")]
    property failed_entries : Array(PutTargetsResultEntry) | Nil

    def initialize(
      @failed_entry_count : Int32 | Nil = nil,
      @failed_entries : Array(PutTargetsResultEntry) | Nil = nil,
    )
    end
  end
end
