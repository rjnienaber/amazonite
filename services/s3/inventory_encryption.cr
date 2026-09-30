private alias Core = Amazonite::Core

module Amazonite::S3
  # Contains the type of server-side encryption used to encrypt the S3 Inventory results.
  class InventoryEncryption
    # Specifies the use of SSE-S3 to encrypt delivered inventory reports.
    property sses3 : SSES3 | Nil

    # Specifies the use of SSE-KMS to encrypt delivered inventory reports.
    property ssekms : SSEKMS | Nil

    def initialize(
      @sses3 : SSES3 | Nil = nil,
      @ssekms : SSEKMS | Nil = nil,
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
      if value = @sses3
        xml.element("SSE-S3") { value.build_xml(xml) }
      end

      if value = @ssekms
        xml.element("SSE-KMS") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        sses3: node.xpath_node("*[local-name()='SSE-S3']").try { |n| SSES3.from_xml(n) },
        ssekms: node.xpath_node("*[local-name()='SSE-KMS']").try { |n| SSEKMS.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @sses3
        value.validate!
      end

      if value = @ssekms
        value.validate!
      end
    end

    def_equals_and_hash(@sses3, @ssekms)
  end
end
