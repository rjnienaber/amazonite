private alias Core = Amazonite::Core

module Amazonite::ApiGateway
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

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rest_api_id, @stage_name, @patch_operations)
  end
end
