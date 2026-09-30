private alias AS = Amazonite::S3

module Amazonite::S3
  # The container element for an ownership control rule.
  class OwnershipControlsRule
    property object_ownership : ObjectOwnership

    def initialize(
      @object_ownership : ObjectOwnership,
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
      xml.element("ObjectOwnership") { xml.text @object_ownership.to_json_object_key }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        object_ownership: ((n = node.xpath_node("*[local-name()='ObjectOwnership']")) ? AS::ObjectOwnership.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@object_ownership)
  end
end
