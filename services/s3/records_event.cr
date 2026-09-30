private alias Core = Amazonite::Core

module Amazonite::S3
  # The container for the records event.
  class RecordsEvent
    # The byte array of partial, one or more result records. S3 Select doesn't guarantee that a record
    # will be self-contained in one record frame. To ensure continuous streaming of data, S3 Select
    # might split the same record across multiple record frames instead of aggregating the results in
    # memory. Some S3 clients (for example, the SDK for Java) handle this behavior by creating a
    # `ByteStream` out of the response by default. Other clients might not handle this behavior by
    # default. In those cases, you must aggregate the results on the client side and parse the
    # response.
    property payload : Bytes | Nil

    def initialize(
      @payload : Bytes | Nil = nil,
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
      if value = @payload
        xml.element("Payload") { xml.text Core::QueryValue.bytes(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        payload: Core::XMLValue.bytes(node.xpath_node("*[local-name()='Payload']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@payload)
  end
end
