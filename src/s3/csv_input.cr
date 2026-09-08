private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes how an uncompressed comma-separated values (CSV)-formatted input object is formatted.
  class CSVInput
    # Describes the first line of input. Valid values are:
    #
    # - `NONE`: First line is not a header.
    #
    # - `IGNORE`: First line is a header, but you can't use the header values to indicate the column
    # in an expression. You can use column position (such as _1, _2, …) to indicate the column
    # (`SELECT s._1 FROM OBJECT s`).
    #
    # - `Use`: First line is a header, and you can use the header value to identify a column in an
    # expression (`SELECT "name" FROM OBJECT`).
    property file_header_info : FileHeaderInfo | Nil

    # A single character used to indicate that a row should be ignored when the character is present
    # at the start of that row. You can specify any character to indicate a comment line. The default
    # character is `#`.
    #
    # Default: `#`
    property comments : String | Nil

    # A single character used for escaping the quotation mark character inside an already escaped
    # value. For example, the value `""" a , b """` is parsed as `" a , b "`.
    property quote_escape_character : String | Nil

    # A single character used to separate individual records in the input. Instead of the default
    # value, you can specify an arbitrary delimiter.
    property record_delimiter : String | Nil

    # A single character used to separate individual fields in a record. You can specify an arbitrary
    # delimiter.
    property field_delimiter : String | Nil

    # A single character used for escaping when the field delimiter is part of the value. For example,
    # if the value is `a, b`, Amazon S3 wraps this field value in quotation marks, as follows: `" a ,
    # b "`.
    #
    # Type: String
    #
    # Default: `"`
    #
    # Ancestors: `CSV`
    property quote_character : String | Nil

    # Specifies that CSV field values may contain quoted record delimiters and such records should be
    # allowed. Default value is FALSE. Setting this value to TRUE may lower performance.
    property allow_quoted_record_delimiter : Bool | Nil

    def initialize(
      @file_header_info : FileHeaderInfo | Nil = nil,
      @comments : String | Nil = nil,
      @quote_escape_character : String | Nil = nil,
      @record_delimiter : String | Nil = nil,
      @field_delimiter : String | Nil = nil,
      @quote_character : String | Nil = nil,
      @allow_quoted_record_delimiter : Bool | Nil = nil,
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
      if value = @file_header_info
        xml.element("FileHeaderInfo") { xml.text value.to_json_object_key }
      end

      if value = @comments
        xml.element("Comments") { xml.text value }
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

      if value = @allow_quoted_record_delimiter
        xml.element("AllowQuotedRecordDelimiter") { xml.text Core::QueryValue.bool(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        file_header_info: (n = node.xpath_node("*[local-name()='FileHeaderInfo']")) ? AS::FileHeaderInfo.from_json_object_key?(n.content) : nil,
        comments: Core::XMLValue.string(node.xpath_node("*[local-name()='Comments']")),
        quote_escape_character: Core::XMLValue.string(node.xpath_node("*[local-name()='QuoteEscapeCharacter']")),
        record_delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='RecordDelimiter']")),
        field_delimiter: Core::XMLValue.string(node.xpath_node("*[local-name()='FieldDelimiter']")),
        quote_character: Core::XMLValue.string(node.xpath_node("*[local-name()='QuoteCharacter']")),
        allow_quoted_record_delimiter: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowQuotedRecordDelimiter']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@file_header_info, @comments, @quote_escape_character, @record_delimiter, @field_delimiter, @quote_character, @allow_quoted_record_delimiter)
  end
end
