private alias AS = Amazonite::S3

module Amazonite::S3
  class DeleteObjectOutput
    # Indicates whether the specified object version that was permanently deleted was (true) or was
    # not (false) a delete marker before deletion. In a simple DELETE, this header indicates whether
    # (true) or not (false) the current version of the object is a delete marker. To learn more about
    # delete markers, see [Working with delete
    # markers](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html).
    #
    # This functionality is not supported for directory buckets.
    property delete_marker : Bool | Nil

    # Returns the version ID of the delete marker created as a result of the DELETE operation.
    #
    # This functionality is not supported for directory buckets.
    property version_id : String | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @delete_marker : Bool | Nil = nil,
      @version_id : String | Nil = nil,
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

    def_equals_and_hash(@delete_marker, @version_id, @request_charged)
  end
end
