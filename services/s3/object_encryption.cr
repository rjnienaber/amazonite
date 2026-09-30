private alias Core = Amazonite::Core

module Amazonite::S3
  # The updated server-side encryption type for this object. The `UpdateObjectEncryption` operation
  # supports the SSE-S3 and SSE-KMS encryption types.
  #
  # Valid Values: `SSES3` | `SSEKMS`
  class ObjectEncryption
    # Specifies to update the object encryption type to server-side encryption with Key Management
    # Service (KMS) keys (SSE-KMS).
    property ssekms : SSEKMSEncryption | Nil

    def initialize(
      @ssekms : SSEKMSEncryption | Nil = nil,
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
      if value = @ssekms
        xml.element("SSE-KMS") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ssekms: node.xpath_node("*[local-name()='SSE-KMS']").try { |n| SSEKMSEncryption.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ssekms
        value.validate!
      end
    end

    def_equals_and_hash(@ssekms)
  end
end
