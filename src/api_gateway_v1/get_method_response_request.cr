module Amazonite::ApiGatewayV1
  # Request to describe a MethodResponse resource.
  class GetMethodResponseRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The Resource identifier for the MethodResponse resource.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # The HTTP verb of the Method resource.
    @[JSON::Field(key: "httpMethod", ignore: true)]
    property http_method : String = ""

    # The status code for the MethodResponse resource.
    @[JSON::Field(key: "statusCode", ignore: true)]
    property status_code : String = ""

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
      @status_code : String,
    )
    end
  end
end
