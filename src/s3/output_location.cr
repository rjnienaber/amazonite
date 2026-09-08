private alias Core = Amazonite::Core

module Amazonite::S3
  # Describes the location where the restore job's output is stored.
  class OutputLocation
    # Describes an S3 location that will receive the results of the restore request.
    property s3 : S3Location | Nil

    def initialize(
      @s3 : S3Location | Nil = nil,
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
      if value = @s3
        xml.element("S3") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3: node.xpath_node("*[local-name()='S3']").try { |n| S3Location.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @s3
        value.validate!
      end
    end

    def_equals_and_hash(@s3)
  end
end
