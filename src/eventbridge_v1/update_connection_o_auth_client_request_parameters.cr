module Amazonite::EventBridgeV1
  # The OAuth authorization parameters to use for the connection.
  class UpdateConnectionOAuthClientRequestParameters
    include JSON::Serializable

    # The client ID to use for OAuth authorization.
    @[JSON::Field(key: "ClientID")]
    property client_id : String | Nil

    # The client secret assciated with the client ID to use for OAuth authorization.
    @[JSON::Field(key: "ClientSecret")]
    property client_secret : String | Nil

    def initialize(
      @client_id : String | Nil = nil,
      @client_secret : String | Nil = nil,
    )
    end

    def_equals_and_hash(@client_id, @client_secret)
  end
end
