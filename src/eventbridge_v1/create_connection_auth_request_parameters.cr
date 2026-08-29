module Amazonite::EventBridgeV1
  # The authorization parameters for the connection.
  #
  # You must include only authorization parameters for the `AuthorizationType` you specify.
  class CreateConnectionAuthRequestParameters
    include JSON::Serializable

    # The Basic authorization parameters to use for the connection.
    @[JSON::Field(key: "BasicAuthParameters")]
    property basic_auth_parameters : CreateConnectionBasicAuthRequestParameters | Nil

    # The OAuth authorization parameters to use for the connection.
    @[JSON::Field(key: "OAuthParameters")]
    property o_auth_parameters : CreateConnectionOAuthRequestParameters | Nil

    # The API key authorization parameters to use for the connection.
    @[JSON::Field(key: "ApiKeyAuthParameters")]
    property api_key_auth_parameters : CreateConnectionApiKeyAuthRequestParameters | Nil

    # The API key authorization parameters to use for the connection. Note that if you include
    # additional parameters for the target of a rule via `HttpParameters`, including query strings,
    # the parameters added for the connection take precedence.
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
      @basic_auth_parameters : CreateConnectionBasicAuthRequestParameters | Nil = nil,
      @o_auth_parameters : CreateConnectionOAuthRequestParameters | Nil = nil,
      @api_key_auth_parameters : CreateConnectionApiKeyAuthRequestParameters | Nil = nil,
      @invocation_http_parameters : ConnectionHttpParameters | Nil = nil,
      @connectivity_parameters : ConnectivityResourceParameters | Nil = nil,
    )
    end
  end
end
