module Amazonite::EventBridgeV1
  class PutPartnerEventsRequest
    include JSON::Serializable

    # The list of events to write to the event bus.
    @[JSON::Field(key: "Entries")]
    property entries : Array(PutPartnerEventsRequestEntry) = [] of PutPartnerEventsRequestEntry

    def initialize(
      @entries : Array(PutPartnerEventsRequestEntry),
    )
    end

    def_equals_and_hash(@entries)
  end
end
