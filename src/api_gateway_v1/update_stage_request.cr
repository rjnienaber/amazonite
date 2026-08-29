module Amazonite::ApiGatewayV1
  # Requests API Gateway to change information about a Stage resource.
  class UpdateStageRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The name of the Stage resource to change information about.
    @[JSON::Field(key: "stageName", ignore: true)]
    property stage_name : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @stage_name : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end
  end
end
