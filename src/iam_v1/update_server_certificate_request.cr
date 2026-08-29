private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UpdateServerCertificateRequest
    property server_certificate_name : String

    property new_path : String | Nil

    property new_server_certificate_name : String | Nil

    def initialize(
      @server_certificate_name : String,
      @new_path : String | Nil = nil,
      @new_server_certificate_name : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}ServerCertificateName", @server_certificate_name}

      if value = @new_path
        params << {"#{prefix}NewPath", value}
      end

      if value = @new_server_certificate_name
        params << {"#{prefix}NewServerCertificateName", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateName']")).not_nil!,
        new_path: Core::XMLValue.string(node.xpath_node("*[local-name()='NewPath']")),
        new_server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='NewServerCertificateName']")),
      )
    end
  end
end
