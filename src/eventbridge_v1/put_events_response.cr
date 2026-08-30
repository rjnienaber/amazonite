module Amazonite::EventBridgeV1
  class PutEventsResponse
    include JSON::Serializable

    # The number of failed entries.
    @[JSON::Field(key: "FailedEntryCount")]
    property failed_entry_count : Int32 | Nil

    # The successfully and unsuccessfully ingested events results. If the ingestion was successful,
    # the entry has the event ID in it. Otherwise, you can use the error code and error message to
    # identify the problem with the entry.
    #
    # For each record, the index of the response element is the same as the index in the request
    # array.
    @[JSON::Field(key: "Entries")]
    property entries : Array(PutEventsResultEntry) | Nil

    def initialize(
      @failed_entry_count : Int32 | Nil = nil,
      @entries : Array(PutEventsResultEntry) | Nil = nil,
    )
    end

    def_equals_and_hash(@failed_entry_count, @entries)
  end
end
