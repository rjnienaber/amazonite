module Amazonite::EventBridgeV1
  class PutPartnerEventsResponse
    include JSON::Serializable

    # The number of events from this operation that could not be written to the partner event bus.
    @[JSON::Field(key: "FailedEntryCount")]
    property failed_entry_count : Int32 | Nil

    # The results for each event entry the partner submitted in this request. If the event was
    # successfully submitted, the entry has the event ID in it. Otherwise, you can use the error code
    # and error message to identify the problem with the entry.
    #
    # For each record, the index of the response element is the same as the index in the request
    # array.
    @[JSON::Field(key: "Entries")]
    property entries : Array(PutPartnerEventsResultEntry) | Nil

    def initialize(
      @failed_entry_count : Int32 | Nil = nil,
      @entries : Array(PutPartnerEventsResultEntry) | Nil = nil,
    )
    end
  end
end
