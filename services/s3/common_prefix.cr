private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for all (if there are any) keys between Prefix and the next occurrence of the string
  # specified by a delimiter. CommonPrefixes lists keys that act like subdirectories in the
  # directory specified by Prefix. For example, if the prefix is notes/ and the delimiter is a slash
  # (/) as in notes/summer/july, the common prefix is notes/summer/.
  class CommonPrefix
    # Container for the specified common prefix.
    property prefix : String | Nil

    def initialize(
      @prefix : String | Nil = nil,
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
      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@prefix)
  end
end
