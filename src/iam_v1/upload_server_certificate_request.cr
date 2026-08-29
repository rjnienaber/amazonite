private alias Core = Amazonite::Core

module Amazonite::IamV1
  class UploadServerCertificateRequest
    property path : String | Nil

    property server_certificate_name : String

    property certificate_body : String

    property private_key : String

    property certificate_chain : String | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @server_certificate_name : String,
      @certificate_body : String,
      @private_key : String,
      @path : String | Nil = nil,
      @certificate_chain : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @path
        params << {"#{prefix}Path", value}
      end

      params << {"#{prefix}ServerCertificateName", @server_certificate_name}

      params << {"#{prefix}CertificateBody", @certificate_body}

      params << {"#{prefix}PrivateKey", @private_key}

      if value = @certificate_chain
        params << {"#{prefix}CertificateChain", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        path: Core::XMLValue.string(node.xpath_node("*[local-name()='Path']")),
        server_certificate_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServerCertificateName']")).not_nil!,
        certificate_body: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateBody']")).not_nil!,
        private_key: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateKey']")).not_nil!,
        certificate_chain: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateChain']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
