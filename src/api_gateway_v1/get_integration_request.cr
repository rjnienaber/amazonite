module Amazonite::ApiGatewayV1
  # Represents a request to get the integration configuration.
  class GetIntegrationRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # Specifies a get integration request's resource identifier
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # Specifies a get integration request's HTTP method.
    @[JSON::Field(key: "httpMethod", ignore: true)]
    property http_method : String = ""

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
    )
    end
  end
end
