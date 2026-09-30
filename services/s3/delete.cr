private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for the objects to delete.
  class Delete
    # The object to delete.
    #
    # **Directory buckets** - For directory buckets, an object that's composed entirely of whitespace
    # characters is not supported by the `DeleteObjects` API operation. The request will receive a
    # `400 Bad Request` error and none of the objects in the request will be deleted.
    property objects : Array(ObjectIdentifier) = [] of ObjectIdentifier

    # Element to enable quiet mode for the request. When you add this element, you must set its value
    # to `true`.
    property quiet : Bool | Nil

    def initialize(
      @objects : Array(ObjectIdentifier),
      @quiet : Bool | Nil = nil,
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
      @objects.each do |item|
        xml.element("Object") { item.build_xml(xml) }
      end

      if value = @quiet
        xml.element("Quiet") { xml.text Core::QueryValue.bool(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        objects: node.xpath_nodes("*[local-name()='Object']").map { |n| ObjectIdentifier.from_xml(n) },
        quiet: Core::XMLValue.bool(node.xpath_node("*[local-name()='Quiet']")),
      )
    end

    def validate! : Nil
      if value = @objects
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@objects, @quiet)
  end
end
