private alias Core = Amazonite::Core

module Amazonite::EC2
  class ExportClientVpnClientCertificateRevocationListResult
    # Information about the client certificate revocation list.
    property certificate_revocation_list : String | Nil

    # The current state of the client certificate revocation list.
    property status : ClientCertificateRevocationListStatus | Nil

    def initialize(
      @certificate_revocation_list : String | Nil = nil,
      @status : ClientCertificateRevocationListStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @certificate_revocation_list
        params << {"#{prefix}CertificateRevocationList", value}
      end

      if value = @status
        params.concat(value.to_query_params("#{prefix}Status."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        certificate_revocation_list: Core::XMLValue.string(node.xpath_node("*[local-name()='certificateRevocationList']")),
        status: node.xpath_node("*[local-name()='status']").try { |n| ClientCertificateRevocationListStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @status
        value.validate!
      end
    end

    def_equals_and_hash(@certificate_revocation_list, @status)
  end
end
