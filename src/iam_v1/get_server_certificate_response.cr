private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains the response to a successful
  # [GetServerCertificate](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServerCertificate.html)
  # request.
  class GetServerCertificateResponse
    # A structure containing details about the server certificate.
    property server_certificate : ServerCertificate

    def initialize(
      @server_certificate : ServerCertificate,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@server_certificate.to_query_params("#{prefix}ServerCertificate."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        server_certificate: node.xpath_node("*[local-name()='ServerCertificate']").try { |n| ServerCertificate.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @server_certificate
        value.validate!
      end
    end

    def_equals_and_hash(@server_certificate)
  end
end
