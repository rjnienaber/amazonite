private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  class CreateApiDestinationRequest
    include JSON::Serializable

    # The name for the API destination to create.
    @[JSON::Field(key: "Name")]
    property name : String

    # A description for the API destination to create.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the connection to use for the API destination. The destination endpoint must support
    # the authorization type specified for the connection.
    @[JSON::Field(key: "ConnectionArn")]
    property connection_arn : String

    # The URL to the HTTP invocation endpoint for the API destination.
    @[JSON::Field(key: "InvocationEndpoint")]
    property invocation_endpoint : String

    # The method to use for the request to the HTTP invocation endpoint.
    @[JSON::Field(key: "HttpMethod", converter: AEB::ApiDestinationHttpMethod)]
    property http_method : ApiDestinationHttpMethod

    # The maximum number of requests per second to send to the HTTP invocation endpoint.
    @[JSON::Field(key: "InvocationRateLimitPerSecond")]
    property invocation_rate_limit_per_second : Int32 | Nil

    def initialize(
      @name : String,
      @connection_arn : String,
      @invocation_endpoint : String,
      @http_method : ApiDestinationHttpMethod,
      @description : String | Nil = nil,
      @invocation_rate_limit_per_second : Int32 | Nil = nil,
    )
    end
  end
end
