private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectAttributesOutput
    # Specifies whether the object retrieved was (`true`) or was not (`false`) a delete marker. If
    # `false`, this response header does not appear in the response. To learn more about delete
    # markers, see [Working with delete
    # markers](https://docs.aws.amazon.com/AmazonS3/latest/userguide/DeleteMarker.html).
    #
    # This functionality is not supported for directory buckets.
    property delete_marker : Bool | Nil

    # Date and time when the object was last modified.
    property last_modified : Time | Nil

    # The version ID of the object.
    #
    # This functionality is not supported for directory buckets.
    property version_id : String | Nil

    property request_charged : RequestCharged | Nil

    # An ETag is an opaque identifier assigned by a web server to a specific version of a resource
    # found at a URL.
    property e_tag : String | Nil

    # The checksum or digest of the object.
    property checksum : Checksum | Nil

    # A collection of parts associated with a multipart upload.
    property object_parts : GetObjectAttributesParts | Nil

    # Provides the storage class information of the object. Amazon S3 returns this header for all
    # objects except for S3 Standard storage class objects.
    #
    # For more information, see [Storage
    # Classes](https://docs.aws.amazon.com/AmazonS3/latest/dev/storage-class-intro.html).
    #
    # **Directory buckets** - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One
    # Zone storage class) in Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access
    # storage class) in Dedicated Local Zones.
    property storage_class : StorageClass | Nil

    # The size of the object in bytes.
    property object_size : Int64 | Nil

    def initialize(
      @delete_marker : Bool | Nil = nil,
      @last_modified : Time | Nil = nil,
      @version_id : String | Nil = nil,
      @request_charged : RequestCharged | Nil = nil,
      @e_tag : String | Nil = nil,
      @checksum : Checksum | Nil = nil,
      @object_parts : GetObjectAttributesParts | Nil = nil,
      @storage_class : StorageClass | Nil = nil,
      @object_size : Int64 | Nil = nil,
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
      if value = @e_tag
        xml.element("ETag") { xml.text value }
      end

      if value = @checksum
        xml.element("Checksum") { value.build_xml(xml) }
      end

      if value = @object_parts
        xml.element("ObjectParts") { value.build_xml(xml) }
      end

      if value = @storage_class
        xml.element("StorageClass") { xml.text value.to_json_object_key }
      end

      if value = @object_size
        xml.element("ObjectSize") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        e_tag: Core::XMLValue.string(node.xpath_node("*[local-name()='ETag']")),
        checksum: node.xpath_node("*[local-name()='Checksum']").try { |n| Checksum.from_xml(n) },
        object_parts: node.xpath_node("*[local-name()='ObjectParts']").try { |n| GetObjectAttributesParts.from_xml(n) },
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::StorageClass.from_json_object_key?(n.content) : nil,
        object_size: Core::XMLValue.i64(node.xpath_node("*[local-name()='ObjectSize']")),
      )
    end

    def validate! : Nil
      if value = @checksum
        value.validate!
      end

      if value = @object_parts
        value.validate!
      end
    end

    def_equals_and_hash(@delete_marker, @last_modified, @version_id, @request_charged, @e_tag, @checksum, @object_parts, @storage_class, @object_size)
  end
end
