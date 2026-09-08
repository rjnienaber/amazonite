private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the client certificate to be used for authentication.
  class CertificateAuthenticationRequest
    # The ARN of the client certificate. The certificate must be signed by a certificate authority
    # (CA) and it must be provisioned in Certificate Manager (ACM).
    property client_root_certificate_chain_arn : String | Nil

    def initialize(
      @client_root_certificate_chain_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_root_certificate_chain_arn
        params << {"#{prefix}ClientRootCertificateChainArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_root_certificate_chain_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientRootCertificateChainArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_root_certificate_chain_arn)
  end
end
