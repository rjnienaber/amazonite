private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for the person being granted permissions.
  class Grantee
    property display_name : String | Nil

    property email_address : String | Nil

    # The canonical user ID of the grantee.
    property id : String | Nil

    # URI of the grantee group.
    property uri : String | Nil

    # Type of grantee
    property type : Type

    def initialize(
      @type : Type,
      @display_name : String | Nil = nil,
      @email_address : String | Nil = nil,
      @id : String | Nil = nil,
      @uri : String | Nil = nil,
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

      if value = @email_address
        xml.element("EmailAddress") { xml.text value }
      end

      if value = @id
        xml.element("ID") { xml.text value }
      end

      if value = @uri
        xml.element("URI") { xml.text value }
      end

      xml.element("xsi:type") { xml.text @type.to_json_object_key }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        display_name: Core::XMLValue.string(node.xpath_node("*[local-name()='DisplayName']")),
        email_address: Core::XMLValue.string(node.xpath_node("*[local-name()='EmailAddress']")),
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='ID']")),
        uri: Core::XMLValue.string(node.xpath_node("*[local-name()='URI']")),
        type: ((n = node.xpath_node("*[local-name()='xsi:type']")) ? AS::Type.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@display_name, @email_address, @id, @uri, @type)
  end
end
