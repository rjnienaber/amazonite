private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class DeleteObjectsOutput
    # Container element for a successful delete. It identifies the object that was successfully
    # deleted.
    property deleted : Array(DeletedObject) | Nil

    property request_charged : RequestCharged | Nil

    # Container for a failed delete action that describes the object that Amazon S3 attempted to
    # delete and the error it encountered.
    property errors : Array(Error) | Nil

    def initialize(
      @deleted : Array(DeletedObject) | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
      @errors : Array(Error) | Nil = nil,
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
      (@deleted || [] of DeletedObject).each do |item|
        xml.element("Deleted") { item.build_xml(xml) }
      end

      (@errors || [] of Error).each do |item|
        xml.element("Error") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        deleted: node.xpath_nodes("*[local-name()='Deleted']").map { |n| DeletedObject.from_xml(n) },
        errors: node.xpath_nodes("*[local-name()='Error']").map { |n| Error.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @deleted
        value.each(&.validate!)
      end

      if value = @errors
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@deleted, @request_charged, @errors)
  end
end
