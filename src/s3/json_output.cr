private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies JSON as request's output serialization format.
  class JSONOutput
    # The value used to separate individual records in the output. If no value is specified, Amazon S3
    # uses a newline character ('\n').
    property record_delimiter : String | Nil

    def initialize(
      @record_delimiter : String | Nil = nil,
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
      if value = @record_delimiter
        xml.element("RecordDelimiter") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        record_delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='RecordDelimiter']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@record_delimiter)
  end
end
