module Amazonite::ApiGatewayV1
  # A request to delete the ClientCertificate resource.
  class DeleteClientCertificateRequest
    include JSON::Serializable

    # The identifier of the ClientCertificate resource to be deleted.
    @[JSON::Field(key: "clientCertificateId", ignore: true)]
    property client_certificate_id : String = ""

    def initialize(
      @client_certificate_id : String,
    )
    end
  end
end
