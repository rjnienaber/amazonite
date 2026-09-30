private alias AEB = Amazonite::EventBridge
private alias Core = Amazonite::Core

module Amazonite::EventBridge
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

    def validate! : Nil
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

    def_equals_and_hash(@name, @description, @connection_arn, @invocation_endpoint, @http_method, @invocation_rate_limit_per_second)
  end
end
