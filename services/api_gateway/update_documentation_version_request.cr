private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Updates an existing documentation version of an API.
  class UpdateDocumentationVersionRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The version identifier of the to-be-updated documentation version.
    @[JSON::Field(key: "documentationVersion", ignore: true)]
    property documentation_version : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @documentation_version : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rest_api_id, @documentation_version, @patch_operations)
  end
end
