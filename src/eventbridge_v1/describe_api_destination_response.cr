private alias AEB = Amazonite::EventBridgeV1
private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  class DescribeApiDestinationResponse
    include JSON::Serializable

    # The ARN of the API destination retrieved.
    @[JSON::Field(key: "ApiDestinationArn")]
    property api_destination_arn : String | Nil

    # The name of the API destination retrieved.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The description for the API destination retrieved.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # The state of the API destination retrieved.
    @[JSON::Field(key: "ApiDestinationState", converter: AEB::ApiDestinationState)]
    property api_destination_state : ApiDestinationState | Nil

    # The ARN of the connection specified for the API destination retrieved.
    @[JSON::Field(key: "ConnectionArn")]
    property connection_arn : String | Nil

    # The URL to use to connect to the HTTP endpoint.
    @[JSON::Field(key: "InvocationEndpoint")]
    property invocation_endpoint : String | Nil

    # The method to use to connect to the HTTP endpoint.
    @[JSON::Field(key: "HttpMethod", converter: AEB::ApiDestinationHttpMethod)]
    property http_method : ApiDestinationHttpMethod | Nil

    # The maximum number of invocations per second to specified for the API destination. Note that if
    # you set the invocation rate maximum to a value lower the rate necessary to send all events
    # received on to the destination HTTP endpoint, some events may not be delivered within the
    # 24-hour retry window. If you plan to set the rate lower than the rate necessary to deliver all
    # events, consider using a dead-letter queue to catch events that are not delivered within 24
    # hours.
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
      @description : String | Nil = nil,
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
