private alias Core = Amazonite::Core

module Amazonite::S3
  # This data type contains information about progress of an operation.
  class Progress
    # The current number of object bytes scanned.
    property bytes_scanned : Int64 | Nil

    # The current number of uncompressed object bytes processed.
    property bytes_processed : Int64 | Nil

    # The current number of bytes of records payload data returned.
    property bytes_returned : Int64 | Nil

    def initialize(
      @bytes_scanned : Int64 | Nil = nil,
      @bytes_processed : Int64 | Nil = nil,
      @bytes_returned : Int64 | Nil = nil,
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
      if value = @bytes_scanned
        xml.element("BytesScanned") { xml.text value.to_s }
      end

      if value = @bytes_processed
        xml.element("BytesProcessed") { xml.text value.to_s }
      end

      if value = @bytes_returned
        xml.element("BytesReturned") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        bytes_scanned: Core::XMLValue.i64(node.xpath_node("*[local-name()='BytesScanned']")),
        bytes_processed: Core::XMLValue.i64(node.xpath_node("*[local-name()='BytesProcessed']")),
        bytes_returned: Core::XMLValue.i64(node.xpath_node("*[local-name()='BytesReturned']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@bytes_scanned, @bytes_processed, @bytes_returned)
  end
end
