private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # The OAuth request parameters to use for the connection.
  class UpdateConnectionOAuthRequestParameters
    include JSON::Serializable

    # The client parameters to use for the connection when OAuth is specified as the authorization
    # type.
    @[JSON::Field(key: "ClientParameters")]
    property client_parameters : UpdateConnectionOAuthClientRequestParameters | Nil

    # The URL to the authorization endpoint when OAuth is specified as the authorization type.
    @[JSON::Field(key: "AuthorizationEndpoint")]
    property authorization_endpoint : String | Nil

    # The method used to connect to the HTTP endpoint.
    @[JSON::Field(key: "HttpMethod", converter: AEB::ConnectionOAuthHttpMethod)]
    property http_method : ConnectionOAuthHttpMethod | Nil

    # The additional HTTP parameters used for the OAuth authorization request.
    @[JSON::Field(key: "OAuthHttpParameters")]
    property o_auth_http_parameters : ConnectionHttpParameters | Nil

    def initialize(
      @client_parameters : UpdateConnectionOAuthClientRequestParameters | Nil = nil,
      @authorization_endpoint : String | Nil = nil,
      @http_method : ConnectionOAuthHttpMethod | Nil = nil,
      @o_auth_http_parameters : ConnectionHttpParameters | Nil = nil,
    )
    end
  end
end
