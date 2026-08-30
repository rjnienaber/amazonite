private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @client_parameters
        value.validate!
      end

      if value = @authorization_endpoint
        raise Core::ValidationError.new("AuthorizationEndpoint length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AuthorizationEndpoint length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("AuthorizationEndpoint does not match the required pattern") unless value.matches?(Regex.new("^((%[0-9A-Fa-f]{2}|[-()_.!~*';/?:@\\x26=+$,A-Za-z0-9])+)([).!';/?:,])?$"))
      end

      if value = @o_auth_http_parameters
        value.validate!
      end
    end

    def_equals_and_hash(@client_parameters, @authorization_endpoint, @http_method, @o_auth_http_parameters)
  end
end
