private alias Core = Amazonite::Core

module Amazonite::S3
  # A metadata key-value pair to store with an object.
  class MetadataEntry
    # Name of the object.
    property name : String | Nil

    # Value of the object.
    property value : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @value : String | Nil = nil,
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
      if value = @name
        xml.element("Name") { xml.text value }
      end

      if value = @value
        xml.element("Value") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        value: Core::XMLValue.string(node.xpath_node("*[local-name()='Value']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@name, @value)
  end
end
