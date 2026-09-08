private alias Core = Amazonite::Core

module Amazonite::S3
  # Information about the deleted object.
  class DeletedObject
    # The name of the deleted object.
    property key : String | Nil

    # The version ID of the deleted object.
    #
    # This functionality is not supported for directory buckets.
    property version_id : String | Nil

    # Indicates whether the specified object version that was permanently deleted was (true) or was
    # not (false) a delete marker before deletion. In a simple DELETE, this header indicates whether
    # (true) or not (false) the current version of the object is a delete marker. To learn more about
    # delete markers, see [Working with delete
    # markers](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html).
    #
    # This functionality is not supported for directory buckets.
    property delete_marker : Bool | Nil

    # The version ID of the delete marker created as a result of the DELETE operation. If you delete a
    # specific object version, the value returned by this header is the version ID of the object
    # version deleted.
    #
    # This functionality is not supported for directory buckets.
    property delete_marker_version_id : String | Nil

    def initialize(
      @key : String | Nil = nil,
      @version_id : String | Nil = nil,
      @delete_marker : Bool | Nil = nil,
      @delete_marker_version_id : String | Nil = nil,
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
      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @version_id
        xml.element("VersionId") { xml.text value }
      end

      if value = @delete_marker
        xml.element("DeleteMarker") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @delete_marker_version_id
        xml.element("DeleteMarkerVersionId") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        delete_marker: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteMarker']")),
        delete_marker_version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='DeleteMarkerVersionId']")),
      )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@key, @version_id, @delete_marker, @delete_marker_version_id)
  end
end
