module Amazonite::ApiGatewayV1
  # Represents a get integration response request.
  class GetIntegrationResponseRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # Specifies a get integration response request's resource identifier.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # Specifies a get integration response request's HTTP method.
    @[JSON::Field(key: "httpMethod", ignore: true)]
    property http_method : String = ""

    # Specifies a get integration response request's status code.
    @[JSON::Field(key: "statusCode", ignore: true)]
    property status_code : String = ""

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
      @status_code : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @resource_id, @http_method, @status_code)
  end
end
