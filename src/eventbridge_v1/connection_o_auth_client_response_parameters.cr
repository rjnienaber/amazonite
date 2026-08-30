module Amazonite::EventBridgeV1
  # The client response parameters for the connection when OAuth is specified as the authorization
  # type.
  class ConnectionOAuthClientResponseParameters
    include JSON::Serializable

    # The client ID associated with the response to the connection request.
    @[JSON::Field(key: "ClientID")]
    property client_id : String | Nil

    def initialize(
      @client_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@client_id)
  end
end
