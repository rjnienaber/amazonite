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

    def validate! : Nil
      if value = @server_certificate_metadata
        value.validate!
      end

      if value = @certificate_body
        raise Core::ValidationError.new("CertificateBody length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CertificateBody length must be <= 16384") if value.size > 16384
        raise Core::ValidationError.new("CertificateBody does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @certificate_chain
        raise Core::ValidationError.new("CertificateChain length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CertificateChain length must be <= 2097152") if value.size > 2097152
        raise Core::ValidationError.new("CertificateChain does not match the required pattern") unless value.matches?(Regex.new("^[\t\n\r -ÿ]+$"))
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@server_certificate_metadata, @certificate_body, @certificate_chain, @tags)
  end
end
