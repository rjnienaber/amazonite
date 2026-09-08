private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for the owner's display name and ID.
  class Owner
    property display_name : String | Nil

    # Container for the ID of the owner.
    property id : String | Nil

    def initialize(
      @display_name : String | Nil = nil,
      @id : String | Nil = nil,
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
      if value = @display_name
        xml.element("DisplayName") { xml.text value }
      end

      if value = @id
        xml.element("ID") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        display_name: Core::XMLValue.string(node.xpath_node("*[local-name()='DisplayName']")),
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='ID']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@display_name, @id)
  end
end
