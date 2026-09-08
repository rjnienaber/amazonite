private alias Core = Amazonite::Core

module Amazonite::S3
  # This data type contains information about the progress event of an operation.
  class ProgressEvent
    # The Progress event details.
    property details : Progress | Nil

    def initialize(
      @details : Progress | Nil = nil,
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
      if value = @details
        xml.element("Details") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        details: node.xpath_node("*[local-name()='Details']").try { |n| Progress.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @details
        value.validate!
      end
    end

    def_equals_and_hash(@details)
  end
end
