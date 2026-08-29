private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # The response parameters when OAuth is specified as the authorization type.
  class ConnectionOAuthResponseParameters
    include JSON::Serializable

    # Details about the client parameters returned when OAuth is specified as the authorization type.
    @[JSON::Field(key: "ClientParameters")]
    property client_parameters : ConnectionOAuthClientResponseParameters | Nil

    # The URL to the HTTP endpoint that authorized the request.
    @[JSON::Field(key: "AuthorizationEndpoint")]
    property authorization_endpoint : String | Nil

    # The method used to connect to the HTTP endpoint.
    @[JSON::Field(key: "HttpMethod", converter: AEB::ConnectionOAuthHttpMethod)]
    property http_method : ConnectionOAuthHttpMethod | Nil

    # The additional HTTP parameters used for the OAuth authorization request.
    @[JSON::Field(key: "OAuthHttpParameters")]
    property o_auth_http_parameters : ConnectionHttpParameters | Nil

    def initialize(
      @client_parameters : ConnectionOAuthClientResponseParameters | Nil = nil,
      @authorization_endpoint : String | Nil = nil,
      @http_method : ConnectionOAuthHttpMethod | Nil = nil,
      @o_auth_http_parameters : ConnectionHttpParameters | Nil = nil,
    )
    end
  end
end
