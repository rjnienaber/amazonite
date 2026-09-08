private alias Core = Amazonite::Core

module Amazonite::S3
  # The container for the completed multipart upload details.
  class CompletedMultipartUpload
    # Array of CompletedPart data types.
    #
    # If you do not supply a valid `Part` with your request, the service sends back an HTTP 400
    # response.
    property parts : Array(CompletedPart) | Nil

    def initialize(
      @parts : Array(CompletedPart) | Nil = nil,
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
      (@parts || [] of CompletedPart).each do |item|
        xml.element("Part") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        parts: node.xpath_nodes("*[local-name()='Part']").map { |n| CompletedPart.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @parts
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@parts)
  end
end
