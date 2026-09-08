private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes how uncompressed comma-separated values (CSV)-formatted results are formatted.
  class CSVOutput
    # Indicates whether to use quotation marks around output fields.
    #
    # - `ALWAYS`: Always use quotation marks for output fields.
    #
    # - `ASNEEDED`: Use quotation marks for output fields when needed.
    property quote_fields : QuoteFields | Nil

    # The single character used for escaping the quote character inside an already escaped value.
    property quote_escape_character : String | Nil

    # A single character used to separate individual records in the output. Instead of the default
    # value, you can specify an arbitrary delimiter.
    property record_delimiter : String | Nil

    # The value used to separate individual fields in a record. You can specify an arbitrary
    # delimiter.
    property field_delimiter : String | Nil

    # A single character used for escaping when the field delimiter is part of the value. For example,
    # if the value is `a, b`, Amazon S3 wraps this field value in quotation marks, as follows: `" a ,
    # b "`.
    property quote_character : String | Nil

    def initialize(
      @quote_fields : QuoteFields | Nil = nil,
      @quote_escape_character : String | Nil = nil,
      @record_delimiter : String | Nil = nil,
      @field_delimiter : String | Nil = nil,
      @quote_character : String | Nil = nil,
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
      if value = @quote_fields
        xml.element("QuoteFields") { xml.text value.to_json_object_key }
      end

      if value = @quote_escape_character
        xml.element("QuoteEscapeCharacter") { xml.text value }
      end

      if value = @record_delimiter
        xml.element("RecordDelimiter") { xml.text value }
      end

      if value = @field_delimiter
        xml.element("FieldDelimiter") { xml.text value }
      end

      if value = @quote_character
        xml.element("QuoteCharacter") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        quote_fields: (n = node.xpath_node("*[local-name()='QuoteFields']")) ? AS::QuoteFields.from_json_object_key?(n.content) : nil,
        quote_escape_character: Core::XMLValue.string(node.xpath_node("*[local-name()='QuoteEscapeCharacter']")),
        record_delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='RecordDelimiter']")),
        field_delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='FieldDelimiter']")),
        quote_character: Core::XMLValue.string(node.xpath_node("*[local-name()='QuoteCharacter']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@quote_fields, @quote_escape_character, @record_delimiter, @field_delimiter, @quote_character)
  end
end
