private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The encryption settings for an S3 Metadata journal table or inventory table configuration.
  class MetadataTableEncryptionConfiguration
    # The encryption type specified for a metadata table. To specify server-side encryption with Key
    # Management Service (KMS) keys (SSE-KMS), use the `aws:kms` value. To specify server-side
    # encryption with Amazon S3 managed keys (SSE-S3), use the `AES256` value.
    property sse_algorithm : TableSseAlgorithm

    # If server-side encryption with Key Management Service (KMS) keys (SSE-KMS) is specified, you
    # must also specify the KMS key Amazon Resource Name (ARN). You must specify a customer-managed
    # KMS key that's located in the same Region as the general purpose bucket that corresponds to the
    # metadata table configuration.
    property kms_key_arn : String | Nil

    def initialize(
      @sse_algorithm : TableSseAlgorithm,
      @kms_key_arn : String | Nil = nil,
    )
    end

    # `root` is the element this shape is serialized under, which restXml
    # takes from the member binding it as the request payload rather than
    # from the shape's own name - they differ often enough (S3 sends a
    # CompletedMultipartUpload as <CompleteMultipartUpload>) that the caller
    # has to supply it.
    def to_xml(root : String) : String
      XML.build(indent: nil) do |xml|
        xml.element(root) { build_xml(xml) }
      end
    end

    def build_xml(xml : XML::Builder) : Nil
      xml.element("SseAlgorithm") { xml.text @sse_algorithm.to_json_object_key }

      if value = @kms_key_arn
        xml.element("KmsKeyArn") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        sse_algorithm: ((n = node.xpath_node("*[local-name()='SseAlgorithm']")) ? AS::TableSseAlgorithm.from_json_object_key?(n.content) : nil).not_nil!,
        kms_key_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='KmsKeyArn']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@sse_algorithm, @kms_key_arn)
  end
end
