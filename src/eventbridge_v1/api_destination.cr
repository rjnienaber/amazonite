private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Contains details about an API destination.
  class ApiDestination
    include JSON::Serializable

    # The ARN of the API destination.
    @[JSON::Field(key: "ApiDestinationArn")]
    property api_destination_arn : String | Nil

    # The name of the API destination.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The state of the API destination.
    @[JSON::Field(key: "ApiDestinationState", converter: AEB::ApiDestinationState)]
    property api_destination_state : ApiDestinationState | Nil

    # The ARN of the connection specified for the API destination.
    @[JSON::Field(key: "ConnectionArn")]
    property connection_arn : String | Nil

    # The URL to the endpoint for the API destination.
    @[JSON::Field(key: "InvocationEndpoint")]
    property invocation_endpoint : String | Nil

    # The method to use to connect to the HTTP endpoint.
    @[JSON::Field(key: "HttpMethod", converter: AEB::ApiDestinationHttpMethod)]
    property http_method : ApiDestinationHttpMethod | Nil

    # The maximum number of invocations per second to send to the HTTP endpoint.
    @[JSON::Field(key: "InvocationRateLimitPerSecond")]
    property invocation_rate_limit_per_second : Int32 | Nil

    # A time stamp for the time that the API destination was created.
    @[JSON::Field(key: "CreationTime", converter: Core::AWSEpochConverter)]
    property creation_time : Time | Nil

    # A time stamp for the time that the API destination was last modified.
    @[JSON::Field(key: "LastModifiedTime", converter: Core::AWSEpochConverter)]
    property last_modified_time : Time | Nil

    def initialize(
      @api_destination_arn : String | Nil = nil,
      @name : String | Nil = nil,
      @api_destination_state : ApiDestinationState | Nil = nil,
      @connection_arn : String | Nil = nil,
      @invocation_endpoint : String | Nil = nil,
      @http_method : ApiDestinationHttpMethod | Nil = nil,
      @invocation_rate_limit_per_second : Int32 | Nil = nil,
      @creation_time : Time | Nil = nil,
      @last_modified_time : Time | Nil = nil,
    )
    end
  end
end
