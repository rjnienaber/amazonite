module Amazonite::ApiGatewayV1
  # A request to get information about the current ClientCertificate resource.
  class GetClientCertificateRequest
    include JSON::Serializable

    # The identifier of the ClientCertificate resource to be described.
    @[JSON::Field(key: "clientCertificateId", ignore: true)]
    property client_certificate_id : String = ""

    def initialize(
      @client_certificate_id : String,
    )
    end

    def_equals_and_hash(@client_certificate_id)
  end
end
