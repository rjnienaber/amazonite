private alias Core = Amazonite::Core

module Amazonite::EventBridge
  # Tthe authorization parameters to use for the connection.
  class ConnectionAuthResponseParameters
    include JSON::Serializable

    # The authorization parameters for Basic authorization.
    @[JSON::Field(key: "BasicAuthParameters")]
    property basic_auth_parameters : ConnectionBasicAuthResponseParameters | Nil

    # The OAuth parameters to use for authorization.
    @[JSON::Field(key: "OAuthParameters")]
    property o_auth_parameters : ConnectionOAuthResponseParameters | Nil

    # The API Key parameters to use for authorization.
    @[JSON::Field(key: "ApiKeyAuthParameters")]
    property api_key_auth_parameters : ConnectionApiKeyAuthResponseParameters | Nil

    # Additional parameters for the connection that are passed through with every invocation to the
    # HTTP endpoint.
    @[JSON::Field(key: "InvocationHttpParameters")]
    property invocation_http_parameters : ConnectionHttpParameters | Nil

    # For private OAuth authentication endpoints. The parameters EventBridge uses to authenticate
    # against the endpoint.
    #
    # For more information, see [Authorization methods for
    # connections](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection-auth.html)
    # in the * *Amazon EventBridge User Guide* *.
    @[JSON::Field(key: "ConnectivityParameters")]
    property connectivity_parameters : DescribeConnectionConnectivityParameters | Nil

    def initialize(
      @basic_auth_parameters : ConnectionBasicAuthResponseParameters | Nil = nil,
      @o_auth_parameters : ConnectionOAuthResponseParameters | Nil = nil,
      @api_key_auth_parameters : ConnectionApiKeyAuthResponseParameters | Nil = nil,
      @invocation_http_parameters : ConnectionHttpParameters | Nil = nil,
      @connectivity_parameters : DescribeConnectionConnectivityParameters | Nil = nil,
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
