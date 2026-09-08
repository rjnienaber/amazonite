private alias AS = Amazonite::S3

module Amazonite::S3
  # A legal hold configuration for an object.
  class ObjectLockLegalHold
    # Indicates whether the specified object has a legal hold in place.
    property status : ObjectLockLegalHoldStatus | Nil

    def initialize(
      @status : ObjectLockLegalHoldStatus | Nil = nil,
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
      if value = @status
        xml.element("Status") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: (n = node.xpath_node("*[local-name()='Status']")) ? AS::ObjectLockLegalHoldStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@status)
  end
end
