private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Represents a method response of a given HTTP status code returned to the client. The method
  # response is passed from the back end through the associated integration response that can be
  # transformed using a mapping template.
  class MethodResponse
    include JSON::Serializable

    # The method response's status code.
    @[JSON::Field(key: "statusCode")]
    property status_code : String | Nil

    # A key-value map specifying required or optional response parameters that API Gateway can send
    # back to the caller. A key defines a method response header and the value specifies whether the
    # associated method response header is required or not. The expression of the key must match the
    # pattern `method.response.header.{name}`, where `name` is a valid and unique header name. API
    # Gateway passes certain integration response data to the method response headers specified here
    # according to the mapping you prescribe in the API's IntegrationResponse. The integration
    # response data that can be mapped include an integration response header expressed in
    # `integration.response.header.{name}`, a static value enclosed within a pair of single quotes
    # (e.g., `'application/json'`), or a JSON expression from the back-end response payload in the
    # form of `integration.response.body.{JSON-expression}`, where `JSON-expression` is a valid JSON
    # expression without the `$` prefix.)
    @[JSON::Field(key: "responseParameters")]
    property response_parameters : Hash(String, Bool) | Nil

    # Specifies the Model resources used for the response's content-type. Response models are
    # represented as a key/value map, with a content-type as the key and a Model name as the value.
    @[JSON::Field(key: "responseModels")]
    property response_models : Hash(String, String) | Nil

    def initialize(
      @status_code : String | Nil = nil,
      @response_parameters : Hash(String, Bool) | Nil = nil,
      @response_models : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @status_code
        raise Core::ValidationError.new("statusCode does not match the required pattern") unless value.matches?(Regex.new("^[1-5]\\d\\d$"))
      end
    end

    def_equals_and_hash(@status_code, @response_parameters, @response_models)
  end
end
