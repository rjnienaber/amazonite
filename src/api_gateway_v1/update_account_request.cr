module Amazonite::ApiGatewayV1
  # Requests API Gateway to change information about the current Account resource.
  class UpdateAccountRequest
    include JSON::Serializable

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def_equals_and_hash(@patch_operations)
  end
end
