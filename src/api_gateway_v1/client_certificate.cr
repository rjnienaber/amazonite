private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  # Represents a client certificate used to configure client-side SSL authentication while sending
  # requests to the integration endpoint.
  class ClientCertificate
    include JSON::Serializable

    # The identifier of the client certificate.
    @[JSON::Field(key: "clientCertificateId")]
    property client_certificate_id : String | Nil

    # The description of the client certificate.
    @[JSON::Field(key: "description")]
    property description : String | Nil

    # The PEM-encoded public key of the client certificate, which can be used to configure certificate
    # authentication in the integration endpoint .
    @[JSON::Field(key: "pemEncodedCertificate")]
    property pem_encoded_certificate : String | Nil

    # The timestamp when the client certificate was created.
    @[JSON::Field(key: "createdDate", converter: Core::AWSEpochConverter)]
    property created_date : Time | Nil

    # The timestamp when the client certificate will expire.
    @[JSON::Field(key: "expirationDate", converter: Core::AWSEpochConverter)]
    property expiration_date : Time | Nil

    # The collection of tags. Each tag element is associated with a given resource.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @client_certificate_id : String | Nil = nil,
      @description : String | Nil = nil,
      @pem_encoded_certificate : String | Nil = nil,
      @created_date : Time | Nil = nil,
      @expiration_date : Time | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
