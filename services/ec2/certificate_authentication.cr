private alias Core = Amazonite::Core

module Amazonite::EC2
  # Information about the client certificate used for authentication.
  class CertificateAuthentication
    # The ARN of the client certificate.
    property client_root_certificate_chain : String | Nil

    def initialize(
      @client_root_certificate_chain : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @client_root_certificate_chain
        params << {"#{prefix}ClientRootCertificateChain", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        client_root_certificate_chain: Core::XMLValue.string(node.xpath_node("*[local-name()='clientRootCertificateChain']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@client_root_certificate_chain)
  end
end
