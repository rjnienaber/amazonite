private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # A request to change information about an ApiKey resource.
  class UpdateApiKeyRequest
    include JSON::Serializable

    # The identifier of the ApiKey resource to be updated.
    @[JSON::Field(key: "apiKey", ignore: true)]
    property api_key : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @api_key : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@api_key, @patch_operations)
  end
end
