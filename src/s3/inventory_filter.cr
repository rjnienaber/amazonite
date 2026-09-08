private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies an S3 Inventory filter. The inventory only includes objects that meet the filter's
  # criteria.
  class InventoryFilter
    # The prefix that an object must have to be included in the inventory results.
    property prefix : String

    def initialize(
      @prefix : String,
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
      xml.element("Prefix") { xml.text @prefix }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@prefix)
  end
end
