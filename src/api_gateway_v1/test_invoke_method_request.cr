module Amazonite::ApiGatewayV1
  # Make a request to simulate the invocation of a Method.
  class TestInvokeMethodRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # Specifies a test invoke method request's resource ID.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # Specifies a test invoke method request's HTTP method.
    @[JSON::Field(key: "httpMethod", ignore: true)]
    property http_method : String = ""

    # The URI path, including query string, of the simulated invocation request. Use this to specify
    # path parameters and query string parameters.
    @[JSON::Field(key: "pathWithQueryString")]
    property path_with_query_string : String | Nil

    # The simulated request body of an incoming invocation request.
    @[JSON::Field(key: "body")]
    property body : String | Nil

    # A key-value map of headers to simulate an incoming invocation request.
    @[JSON::Field(key: "headers")]
    property headers : Hash(String, String) | Nil

    # The headers as a map from string to list of values to simulate an incoming invocation request.
    @[JSON::Field(key: "multiValueHeaders")]
    property multi_value_headers : Hash(String, Array(String)) | Nil

    # A ClientCertificate identifier to use in the test invocation. API Gateway will use the
    # certificate when making the HTTPS request to the defined back-end endpoint.
    @[JSON::Field(key: "clientCertificateId")]
    property client_certificate_id : String | Nil

    # A key-value map of stage variables to simulate an invocation on a deployed Stage.
    @[JSON::Field(key: "stageVariables")]
    property stage_variables : Hash(String, String) | Nil

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
      @path_with_query_string : String | Nil = nil,
      @body : String | Nil = nil,
      @headers : Hash(String, String) | Nil = nil,
      @multi_value_headers : Hash(String, Array(String)) | Nil = nil,
      @client_certificate_id : String | Nil = nil,
      @stage_variables : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rest_api_id, @resource_id, @http_method, @path_with_query_string, @body, @headers, @multi_value_headers, @client_certificate_id, @stage_variables)
  end
end
