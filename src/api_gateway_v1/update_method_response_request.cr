module Amazonite::ApiGatewayV1
  # A request to update an existing MethodResponse resource.
  class UpdateMethodResponseRequest
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

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @http_method : String,
      @status_code : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end
  end
end
