private alias AAG = Amazonite::ApiGatewayV1

module Amazonite::ApiGatewayV1
  # Represents a put integration response request.
  class PutIntegrationResponseRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # Specifies a put integration response request's resource identifier.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # Specifies a put integration response request's HTTP method.
    @[JSON::Field(key: "httpMethod", ignore: true)]
    property http_method : String = ""

    # Specifies the status code that is used to map the integration response to an existing
    # MethodResponse.
    @[JSON::Field(key: "statusCode", ignore: true)]
    property status_code : String = ""

    # Specifies the selection pattern of a put integration response.
    @[JSON::Field(key: "selectionPattern")]
    property selection_pattern : String | Nil

    # A key-value map specifying response parameters that are passed to the method response from the
    # back end. The key is a method response header parameter name and the mapped value is an
    # integration response header value, a static value enclosed within a pair of single quotes, or a
    # JSON expression from the integration response body. The mapping key must match the pattern of
    # `method.response.header.{name}`, where `name` is a valid and unique header name. The mapped
    # non-static value must match the pattern of `integration.response.header.{name}` or
    # `integration.response.body.{JSON-expression}`, where `name` must be a valid and unique response
    # header name and `JSON-expression` a valid JSON expression without the `$` prefix.
    @[JSON::Field(key: "responseParameters")]
    property response_parameters : Hash(String, String) | Nil

    # Specifies a put integration response's templates.
    @[JSON::Field(key: "responseTemplates")]
    property response_templates : Hash(String, String) | Nil

    # Specifies how to handle response payload content type conversions. Supported values are
    # `CONVERT_TO_BINARY` and `CONVERT_TO_TEXT`, with the following behaviors:
    #
    # If this property is not defined, the response payload will be passed through from the
    # integration response to the method response without modification.
    @[JSON::Field(key: "contentHandling", converter: AAG::ContentHandlingStrategy)]
    property content_handling : ContentHandlingStrategy | Nil

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
      @status_code : String,
      @selection_pattern : String | Nil = nil,
      @response_parameters : Hash(String, String) | Nil = nil,
      @response_templates : Hash(String, String) | Nil = nil,
      @content_handling : ContentHandlingStrategy | Nil = nil,
    )
    end
  end
end
