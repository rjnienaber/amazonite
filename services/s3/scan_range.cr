private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the byte range of the object to get the records from. A record is processed when its
  # first byte is contained by the range. This parameter is optional, but when specified, it must
  # not be empty. See RFC 2616, Section 14.35.1 about how to specify the start and end of the range.
  class ScanRange
    # Specifies the start of the byte range. This parameter is optional. Valid values: non-negative
    # integers. The default value is 0. If only `start` is supplied, it means scan from that point to
    # the end of the file. For example, `50` means scan from byte 50 until the end of the file.
    property start : Int64 | Nil

    # Specifies the end of the byte range. This parameter is optional. Valid values: non-negative
    # integers. The default value is one less than the size of the object being queried. If only the
    # End parameter is supplied, it is interpreted to mean scan the last N bytes of the file. For
    # example, `50` means scan the last 50 bytes.
    property end : Int64 | Nil

    def initialize(
      @start : Int64 | Nil = nil,
      @end : Int64 | Nil = nil,
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
      if value = @start
        xml.element("Start") { xml.text value.to_s }
      end

      if value = @end
        xml.element("End") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        start: Core::XMLValue.i64(node.xpath_node("*[local-name()='Start']")),
        end: Core::XMLValue.i64(node.xpath_node("*[local-name()='End']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@start, @end)
  end
end
