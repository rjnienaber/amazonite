private alias Core = Amazonite::Core

module Amazonite::IamV1
  class DeleteServerCertificateRequest
    property server_certificate_name : String

    def initialize(
      @server_certificate_name : String,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ServerCertificateName", @server_certificate_name}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateName']")).not_nil!,
      )
    end
  end
end
