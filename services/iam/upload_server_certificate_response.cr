private alias Core = Amazonite::Core

module Amazonite::Iam
  # Contains the response to a successful
  # [UploadServerCertificate](https://docs.aws.amazon.com/IAM/latest/APIReference/API_UploadServerCertificate.html)
  # request.
  class UploadServerCertificateResponse
    # The meta information of the uploaded server certificate without its certificate body,
    # certificate chain, and private key.
    property server_certificate_metadata : ServerCertificateMetadata | Nil

    # A list of tags that are attached to the new IAM server certificate. The returned list of tags is
    # sorted by tag key. For more information about tagging, see [Tagging IAM
    # resources](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html) in the *IAM User
    # Guide*.
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

    def validate! : Nil
      if value = @server_certificate_metadata
        value.validate!
      end

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Tags must have at most 50 item(s)") if value.size > 50
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@server_certificate_metadata, @tags)
  end
end
