module Amazonite::EventBridgeV1
  # These are custom parameter to be used when the target is an API Gateway APIs or EventBridge
  # ApiDestinations. In the latter case, these are merged with any InvocationParameters specified on
  # the Connection, with any values from the Connection taking precedence.
  class HttpParameters
    include JSON::Serializable

    # The path parameter values to be used to populate API Gateway API or EventBridge ApiDestination
    # path wildcards ("*").
    @[JSON::Field(key: "PathParameterValues")]
    property path_parameter_values : Array(String) | Nil

    # The headers that need to be sent as part of request invoking the API Gateway API or EventBridge
    # ApiDestination.
    @[JSON::Field(key: "HeaderParameters")]
    property header_parameters : Hash(String, String) | Nil

    # The query string keys/values that need to be sent as part of request invoking the API Gateway
    # API or EventBridge ApiDestination.
    @[JSON::Field(key: "QueryStringParameters")]
    property query_string_parameters : Hash(String, String) | Nil

    def initialize(
      @path_parameter_values : Array(String) | Nil = nil,
      @header_parameters : Hash(String, String) | Nil = nil,
      @query_string_parameters : Hash(String, String) | Nil = nil,
    )
    end
  end
end
