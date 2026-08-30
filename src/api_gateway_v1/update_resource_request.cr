module Amazonite::ApiGatewayV1
  # Request to change information about a Resource resource.
  class UpdateResourceRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier of the Resource resource.
    @[JSON::Field(key: "resourceId", ignore: true)]
    property resource_id : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @resource_id : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end
  end
end
