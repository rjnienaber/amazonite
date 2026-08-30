module Amazonite::ApiGatewayV1
  # Make a request to simulate the invocation of an Authorizer.
  class TestInvokeAuthorizerRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # Specifies a test invoke authorizer request's Authorizer ID.
    @[JSON::Field(key: "authorizerId", ignore: true)]
    property authorizer_id : String = ""

    # A key-value map of headers to simulate an incoming invocation request. This is where the
    # incoming authorization token, or identity source, should be specified.
    @[JSON::Field(key: "headers")]
    property headers : Hash(String, String) | Nil

    # The headers as a map from string to list of values to simulate an incoming invocation request.
    # This is where the incoming authorization token, or identity source, may be specified.
    @[JSON::Field(key: "multiValueHeaders")]
    property multi_value_headers : Hash(String, Array(String)) | Nil

    # The URI path, including query string, of the simulated invocation request. Use this to specify
    # path parameters and query string parameters.
    @[JSON::Field(key: "pathWithQueryString")]
    property path_with_query_string : String | Nil

    # The simulated request body of an incoming invocation request.
    @[JSON::Field(key: "body")]
    property body : String | Nil

    # A key-value map of stage variables to simulate an invocation on a deployed Stage.
    @[JSON::Field(key: "stageVariables")]
    property stage_variables : Hash(String, String) | Nil

    # A key-value map of additional context variables.
    @[JSON::Field(key: "additionalContext")]
    property additional_context : Hash(String, String) | Nil

    def initialize(
      @rest_api_id : String,
      @authorizer_id : String,
      @headers : Hash(String, String) | Nil = nil,
      @multi_value_headers : Hash(String, Array(String)) | Nil = nil,
      @path_with_query_string : String | Nil = nil,
      @body : String | Nil = nil,
      @stage_variables : Hash(String, String) | Nil = nil,
      @additional_context : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @authorizer_id, @headers, @multi_value_headers, @path_with_query_string, @body, @stage_variables, @additional_context)
  end
end
