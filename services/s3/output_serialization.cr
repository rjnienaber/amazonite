private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes how results of the Select job are serialized.
  class OutputSerialization
    # Describes the serialization of CSV-encoded Select results.
    property csv : CSVOutput | Nil

    # Specifies JSON as request's output serialization format.
    property json : JSONOutput | Nil

    def initialize(
      @csv : CSVOutput | Nil = nil,
      @json : JSONOutput | Nil = nil,
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
      if value = @csv
        xml.element("CSV") { value.build_xml(xml) }
      end

      if value = @json
        xml.element("JSON") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        csv: node.xpath_node("*[local-name()='CSV']").try { |n| CSVOutput.from_xml(n) },
        json: node.xpath_node("*[local-name()='JSON']").try { |n| JSONOutput.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @csv
        value.validate!
      end

      if value = @json
        value.validate!
      end
    end

    def_equals_and_hash(@csv, @json)
  end
end
