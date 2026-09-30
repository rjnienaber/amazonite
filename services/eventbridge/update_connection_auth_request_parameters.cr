private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # Contains the additional parameters to use for the connection.
  class UpdateConnectionAuthRequestParameters
    include JSON::Serializable

    # The authorization parameters for Basic authorization.
    @[JSON::Field(key: "BasicAuthParameters")]
    property basic_auth_parameters : UpdateConnectionBasicAuthRequestParameters | Nil

    # The authorization parameters for OAuth authorization.
    @[JSON::Field(key: "OAuthParameters")]
    property o_auth_parameters : UpdateConnectionOAuthRequestParameters | Nil

    # The authorization parameters for API key authorization.
    @[JSON::Field(key: "ApiKeyAuthParameters")]
    property api_key_auth_parameters : UpdateConnectionApiKeyAuthRequestParameters | Nil

    # The additional parameters to use for the connection.
    @[JSON::Field(key: "InvocationHttpParameters")]
    property invocation_http_parameters : ConnectionHttpParameters | Nil

    # If you specify a private OAuth endpoint, the parameters for EventBridge to use when
    # authenticating against the endpoint.
    #
    # For more information, see [Authorization methods for
    # connections](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection-auth.html)
    # in the * *Amazon EventBridge User Guide* *.
    @[JSON::Field(key: "ConnectivityParameters")]
    property connectivity_parameters : ConnectivityResourceParameters | Nil

    def initialize(
      @basic_auth_parameters : UpdateConnectionBasicAuthRequestParameters | Nil = nil,
      @o_auth_parameters : UpdateConnectionOAuthRequestParameters | Nil = nil,
      @api_key_auth_parameters : UpdateConnectionApiKeyAuthRequestParameters | Nil = nil,
      @invocation_http_parameters : ConnectionHttpParameters | Nil = nil,
      @connectivity_parameters : ConnectivityResourceParameters | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @basic_auth_parameters
        value.validate!
      end

      if value = @o_auth_parameters
        value.validate!
      end

      if value = @api_key_auth_parameters
        value.validate!
      end

      if value = @invocation_http_parameters
        value.validate!
      end

      if value = @connectivity_parameters
        value.validate!
      end
    end

    def_equals_and_hash(@basic_auth_parameters, @o_auth_parameters, @api_key_auth_parameters, @invocation_http_parameters, @connectivity_parameters)
  end
end
