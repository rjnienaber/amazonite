module Amazonite::IamV1
  # Contains the response to a successful
  # [UploadSigningCertificate](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadSigningCertificate.html)
  # request.
  class UploadSigningCertificateResponse
    # Information about the certificate.
    property certificate : SigningCertificate

    def initialize(
      @certificate : SigningCertificate,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@certificate.to_query_params("#{prefix}Certificate."))
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        certificate: node.xpath_node("*[local-name()='Certificate']").try { |n| SigningCertificate.from_xml(n) }.not_nil!,
      )
    end

    def_equals_and_hash(@certificate)
  end
end
