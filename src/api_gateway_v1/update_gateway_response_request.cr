private alias AAG = Amazonite::ApiGatewayV1
private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # Updates a GatewayResponse of a specified response type on the given RestApi.
  class UpdateGatewayResponseRequest
    include JSON::Serializable

    # The string identifier of the associated RestApi.
    @[JSON::Field(key: "restApiId", ignore: true)]
    property rest_api_id : String = ""

    # The response type of the associated GatewayResponse.
    @[JSON::Field(key: "responseType", converter: AAG::GatewayResponseType, ignore: true)]
    property response_type : GatewayResponseType = AAG::GatewayResponseType::Default4xx

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @rest_api_id : String,
      @response_type : GatewayResponseType,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @patch_operations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rest_api_id, @response_type, @patch_operations)
  end
end
