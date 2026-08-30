module Amazonite::ApiGatewayV1
  # A request to change information about an ClientCertificate resource.
  class UpdateClientCertificateRequest
    include JSON::Serializable

    # The identifier of the ClientCertificate resource to be updated.
    @[JSON::Field(key: "clientCertificateId", ignore: true)]
    property client_certificate_id : String = ""

    # For more information about supported patch operations, see [Patch
    # Operations](https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html).
    @[JSON::Field(key: "patchOperations")]
    property patch_operations : Array(PatchOperation) | Nil

    def initialize(
      @client_certificate_id : String,
      @patch_operations : Array(PatchOperation) | Nil = nil,
    )
    end

    def_equals_and_hash(@client_certificate_id, @patch_operations)
  end
end
