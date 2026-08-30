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

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("Description does not match the required pattern") unless value.matches?(Regex.new(".*"))
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

    def_equals_and_hash(@api_destination_arn, @name, @description, @api_destination_state, @connection_arn, @invocation_endpoint, @http_method, @invocation_rate_limit_per_second, @creation_time, @last_modified_time)
  end
end
