module Amazonite::ApiGatewayV1
  # Request to update an existing Authorizer resource.
  class UpdateAuthorizerRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier of the Authorizer resource.
    @[JSON::Field(key: "authorizerId", ignore: true)]
    property authorizer_id : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @authorizer_id : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def_equals_and_hash(@rest_api_id, @authorizer_id, @patch_operations)
  end
end
