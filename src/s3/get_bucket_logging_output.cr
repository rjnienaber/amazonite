private alias Core = Amazonite::Core

module Amazonite::S3
  class GetBucketLoggingOutput
    property logging_enabled : LoggingEnabled | Nil

    def initialize(
      @logging_enabled : LoggingEnabled | Nil = nil,
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
      if value = @logging_enabled
        xml.element("LoggingEnabled") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        logging_enabled: node.xpath_node("*[local-name()='LoggingEnabled']").try { |n| LoggingEnabled.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @logging_enabled
        value.validate!
      end
    end

    def_equals_and_hash(@logging_enabled)
  end
end
