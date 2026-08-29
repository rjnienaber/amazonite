module Amazonite::ApiGatewayV1
  # Updates a RequestValidator of a given RestApi.
  class UpdateRequestValidatorRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The identifier of RequestValidator to be updated.
    @[JSON::Field(key: "requestValidatorId", ignore: true)]
    property request_validator_id : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @request_validator_id : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end
  end
end
