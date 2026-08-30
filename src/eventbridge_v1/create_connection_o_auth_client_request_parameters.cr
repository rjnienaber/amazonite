module Amazonite::EventBridgeV1
  # The Basic authorization parameters to use for the connection.
  class CreateConnectionOAuthClientRequestParameters
    include JSON::Serializable

    # The client ID to use for OAuth authorization for the connection.
    @[JSON::Field(key: "ClientID")]
    property client_id : String

    # The client secret associated with the client ID to use for OAuth authorization for the
    # connection.
    @[JSON::Field(key: "ClientSecret")]
    property client_secret : String

    def initialize(
      @client_id : String,
      @client_secret : String,
    )
    end
  end
end
