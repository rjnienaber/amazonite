private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @entries
        raise Core::ValidationError.new("Entries must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Entries must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@entries)
  end
end
