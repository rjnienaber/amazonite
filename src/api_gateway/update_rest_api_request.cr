private alias Core = Amazonite::Core

module Amazonite::ApiGateway
  # Request to update an existing RestApi resource in your collection.
  class UpdateRestApiRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rest_api_id, @patch_operations)
  end
end
