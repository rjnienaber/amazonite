module Amazonite::IamV1
  class UploadServerCertificateResponse
    property server_certificate_metadata : ServerCertificateMetadata | Nil

    property tags : Array(Tag) | Nil

    def initialize(
      @server_certificate_metadata : ServerCertificateMetadata | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @server_certificate_metadata
        params.concat(value.to_query_params("#{prefix}ServerCertificateMetadata."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Tags.member.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        server_certificate_metadata: node.xpath_node("*[local-name()='ServerCertificateMetadata']").try { |n| ServerCertificateMetadata.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end
  end
end
