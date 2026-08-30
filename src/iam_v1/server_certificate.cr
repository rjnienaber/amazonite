private alias Core = Amazonite::Core

module Amazonite::IamV1
  # Contains information about a server certificate.
  #
  # This data type is used as a response element in the
  # [GetServerCertificate](https://docs.aws.amazon.com/IAM/latest/APIReference/API_GetServerCertificate.html)
  # operation.
  class ServerCertificate
    # The meta information of the server certificate, such as its name, path, ID, and ARN.
    property server_certificate_metadata : ServerCertificateMetadata

    # The contents of the public key certificate.
    property certificate_body : String

    # The contents of the public key certificate chain.
    property certificate_chain : String | Nil

    # A list of tags that are attached to the server certificate. For more information about tagging,
    # see [Tagging IAM resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in
    # the *IAM User Guide*.
    property tags : Array(Tag) | Nil

    def initialize(
      @server_certificate_metadata : ServerCertificateMetadata,
      @certificate_body : String,
      @certificate_chain : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params.concat(@server_certificate_metadata.to_query_params("#{prefix}ServerCertificateMetadata."))

      params << {"#{prefix}CertificateBody", @certificate_body}

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
        server_certificate_metadata: node.xpath_node("*[local-name()='ServerCertificateMetadata']").try { |n| ServerCertificateMetadata.from_xml(n) }.not_nil!,
        certificate_body: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateBody']")).not_nil!,
        certificate_chain: Core::XMLValue.string(node.xpath_node("*[local-name()='CertificateChain']")),
        tags: node.xpath_nodes("*[local-name()='Tags']/*[local-name()='member']").map { |n| Tag.from_xml(n) },
      )
    end

    def_equals_and_hash(@server_certificate_metadata, @certificate_body, @certificate_chain, @tags)
  end
end
