private alias AS = Amazonite::S3

module Amazonite::S3
  class DeleteObjectAnnotationOutput
    # The version ID of the object that the annotation was deleted from.
    property object_version_id : String | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @object_version_id : String | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@object_version_id, @request_charged)
  end
end
