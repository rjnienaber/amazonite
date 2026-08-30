private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class PutEventsRequest
    include JSON::Serializable

    # The entry that defines an event in your system. You can specify several parameters for the entry
    # such as the source and type of the event, resources associated with the event, and so on.
    @[JSON::Field(key: "Entries")]
    property entries : Array(PutEventsRequestEntry) = [] of PutEventsRequestEntry

    # The URL subdomain of the endpoint. For example, if the URL for Endpoint is
    # https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is `abcde.veo`.
    #
    # When using Java, you must include `auth-crt` on the class path.
    @[JSON::Field(key: "EndpointId")]
    property endpoint_id : String | Nil

    def initialize(
      @entries : Array(PutEventsRequestEntry),
      @endpoint_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @entries
        raise Core::ValidationError.new("Entries must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Entries must have at most 10 item(s)") if value.size > 10
        value.each(&.validate!)
      end

      if value = @endpoint_id
        raise Core::ValidationError.new("EndpointId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EndpointId length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("EndpointId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9\\-]+[\\.][A-Za-z0-9\\-]+$"))
      end
    end

    def_equals_and_hash(@entries, @endpoint_id)
  end
end
