private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # Contains the OAuth authorization parameters to use for the connection.
  class CreateConnectionOAuthRequestParameters
    include JSON::Serializable

    # The client parameters for OAuth authorization.
    @[JSON::Field(key: "ClientParameters")]
    property client_parameters : CreateConnectionOAuthClientRequestParameters

    # The URL to the authorization endpoint when OAuth is specified as the authorization type.
    @[JSON::Field(key: "AuthorizationEndpoint")]
    property authorization_endpoint : String

    # The method to use for the authorization request.
    @[JSON::Field(key: "HttpMethod", converter: AEB::ConnectionOAuthHttpMethod)]
    property http_method : ConnectionOAuthHttpMethod

    # Details about the additional parameters to use for the connection.
    @[JSON::Field(key: "OAuthHttpParameters")]
    property o_auth_http_parameters : ConnectionHttpParameters | Nil

    def initialize(
      @client_parameters : CreateConnectionOAuthClientRequestParameters,
      @authorization_endpoint : String,
      @http_method : ConnectionOAuthHttpMethod,
      @o_auth_http_parameters : ConnectionHttpParameters | Nil = nil,
    )
    end

    def_equals_and_hash(@client_parameters, @authorization_endpoint, @http_method, @o_auth_http_parameters)
  end
end
