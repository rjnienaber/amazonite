private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  class UpdateApiDestinationRequest
    include JSON::Serializable

    # The name of the API destination to update.
    @[JSON::Field(key: "Name")]
    property name : String

    # The name of the API destination to update.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The ARN of the connection to use for the API destination.
    @[JSON::Field(key: "ConnectionArn")]
    property connection_arn : String | Nil

    # The URL to the endpoint to use for the API destination.
    @[JSON::Field(key: "InvocationEndpoint")]
    property invocation_endpoint : String | Nil

    # The method to use for the API destination.
    @[JSON::Field(key: "HttpMethod", converter: AEB::ApiDestinationHttpMethod)]
    property http_method : ApiDestinationHttpMethod | Nil

    # The maximum number of invocations per second to send to the API destination.
    @[JSON::Field(key: "InvocationRateLimitPerSecond")]
    property invocation_rate_limit_per_second : Int32 | Nil

    def initialize(
      @name : String,
      @description : String | Nil = nil,
      @connection_arn : String | Nil = nil,
      @invocation_endpoint : String | Nil = nil,
      @http_method : ApiDestinationHttpMethod | Nil = nil,
      @invocation_rate_limit_per_second : Int32 | Nil = nil,
    )
    end
  end
end
