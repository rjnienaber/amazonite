private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for specifying if periodic `QueryProgress` messages should be sent.
  class RequestProgress
    # Specifies whether periodic QueryProgress frames should be sent. Valid values: TRUE, FALSE.
    # Default value: FALSE.
    property enabled : Bool | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
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
      if value = @enabled
        xml.element("Enabled") { xml.text Core::QueryValue.bool(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled)
  end
end
