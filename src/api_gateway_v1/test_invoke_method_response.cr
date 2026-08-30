module Amazonite::ApiGatewayV1
  # Represents the response of the test invoke request in the HTTP method.
  class TestInvokeMethodResponse
    include JSON::Serializable

    # The HTTP status code.
    @[JSON::Field(key: "status")]
    property status : Int32 | Nil

    # The body of the HTTP response.
    @[JSON::Field(key: "body")]
    property body : String | Nil

    # The headers of the HTTP response.
    @[JSON::Field(key: "headers")]
    property headers : Hash(String, String) | Nil

    # The headers of the HTTP response as a map from string to list of values.
    @[JSON::Field(key: "multiValueHeaders")]
    property multi_value_headers : Hash(String, Array(String)) | Nil

    # The API Gateway execution log for the test invoke request.
    @[JSON::Field(key: "log")]
    property log : String | Nil

    # The execution latency, in ms, of the test invoke request.
    @[JSON::Field(key: "latency")]
    property latency : Int64 | Nil

    def initialize(
      @status : Int32 | Nil = nil,
      @body : String | Nil = nil,
      @headers : Hash(String, String) | Nil = nil,
      @multi_value_headers : Hash(String, Array(String)) | Nil = nil,
      @log : String | Nil = nil,
      @latency : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@status, @body, @headers, @multi_value_headers, @log, @latency)
  end
end
