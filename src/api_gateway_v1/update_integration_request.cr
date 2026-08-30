module Amazonite::ApiGatewayV1
  # Represents an update integration request.
  class UpdateIntegrationRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # Represents an update integration request's resource identifier.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # Represents an update integration request's HTTP method.
    @[JSON::Field(key: "httpMethod", ignore: true)]
    property http_method : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def_equals_and_hash(@rest_api_id, @resource_id, @http_method, @patch_operations)
  end
end
