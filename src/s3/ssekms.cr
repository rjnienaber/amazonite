private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the use of SSE-KMS to encrypt delivered inventory reports.
  class SSEKMS
    # Specifies the ID of the Key Management Service (KMS) symmetric encryption customer managed key
    # to use for encrypting inventory reports.
    property key_id : String

    def initialize(
      @key_id : String,
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
      xml.element("KeyId") { xml.text @key_id }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key_id: Core::XMLValue.string(node.xpath_node("*[local-name()='KeyId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@key_id)
  end
end
