module Amazonite::ApiGatewayV1
  # Request to describe an existing Method resource.
  class GetMethodRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The Resource identifier for the Method resource.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # Specifies the method request's HTTP method type.
    @[JSON::Field(key: "httpMethod", ignore: true)]
    property http_method : String = ""

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
    )
    end

    def_equals_and_hash(@rest_api_id, @resource_id, @http_method)
  end
end
