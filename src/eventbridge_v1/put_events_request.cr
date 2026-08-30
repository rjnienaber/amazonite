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

    def_equals_and_hash(@entries, @endpoint_id)
  end
end
