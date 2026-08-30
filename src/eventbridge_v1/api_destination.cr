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

    def validate! : Nil
      if value = @api_destination_arn
        raise Core::ValidationError.new("ApiDestinationArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ApiDestinationArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ApiDestinationArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:api-destination\\/[\\.\\-_A-Za-z0-9]+\\/[\\-A-Za-z0-9]+$"))
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Name length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @connection_arn
        raise Core::ValidationError.new("ConnectionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ConnectionArn length must be <= 1600") if value.size > 1600
        raise Core::ValidationError.new("ConnectionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:aws([a-z]|\\-)*:events:([a-z]|\\d|\\-)*:([0-9]{12})?:connection\\/[\\.\\-_A-Za-z0-9]+\\/[\\-A-Za-z0-9]+$"))
      end

      if value = @invocation_endpoint
        raise Core::ValidationError.new("InvocationEndpoint length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("InvocationEndpoint length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("InvocationEndpoint does not match the required pattern") unless value.matches?(Regex.new("^((%[0-9A-Fa-f]{2}|[-()_.!~*';/?:@\\x26=+$,A-Za-z0-9])+)([).!';/?:,])?$"))
      end

      if value = @invocation_rate_limit_per_second
        raise Core::ValidationError.new("InvocationRateLimitPerSecond value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@api_destination_arn, @name, @api_destination_state, @connection_arn, @invocation_endpoint, @http_method, @invocation_rate_limit_per_second, @creation_time, @last_modified_time)
  end
end
