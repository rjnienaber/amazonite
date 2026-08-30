module Amazonite::ApiGatewayV1
  # Request to add a MethodResponse to an existing Method resource.
  class PutMethodResponseRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The Resource identifier for the Method resource.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # The HTTP verb of the Method resource.
    @[JSON::Field(key: "httpMethod", ignore: true)]
    property http_method : String = ""

    # The method response's status code.
    @[JSON::Field(key: "statusCode", ignore: true)]
    property status_code : String = ""

    # A key-value map specifying required or optional response parameters that API Gateway can send
    # back to the caller. A key defines a method response header name and the associated value is a
    # Boolean flag indicating whether the method response parameter is required or not. The method
    # response header names must match the pattern of `method.response.header.{name}`, where `name` is
    # a valid and unique header name. The response parameter names defined here are available in the
    # integration response to be mapped from an integration response header expressed in
    # `integration.response.header.{name}`, a static value enclosed within a pair of single quotes
    # (e.g., `'application/json'`), or a JSON expression from the back-end response payload in the
    # form of `integration.response.body.{JSON-expression}`, where `JSON-expression` is a valid JSON
    # expression without the `$` prefix.)
    @[JSON::Field(key: "responseParameters")]
    property response_parameters : Hash(String, Bool) | Nil

    # Specifies the Model resources used for the response's content type. Response models are
    # represented as a key/value map, with a content type as the key and a Model name as the value.
    @[JSON::Field(key: "responseModels")]
    property response_models : Hash(String, String) | Nil

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
      @status_code : String,
      @response_parameters : Hash(String, Bool) | Nil = nil,
      @response_models : Hash(String, String) | Nil = nil,
    )
    end

    def_equals_and_hash(@rest_api_id, @resource_id, @http_method, @status_code, @response_parameters, @response_models)
  end
end
