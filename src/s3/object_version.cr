private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The version of an object.
  class ObjectVersion
    # The entity tag is an MD5 hash of that version of the object.
    property e_tag : String | Nil

    # The algorithm that was used to create a checksum of the object.
    property checksum_algorithm : Array(ChecksumAlgorithm) | Nil

    # The checksum type that is used to calculate the object’s checksum value. For more information,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_type : ChecksumType | Nil

    # Size in bytes of the object.
    property size : Int64 | Nil

    # The class of storage used to store the object.
    property storage_class : ObjectVersionStorageClass | Nil

    # The object key.
    property key : String | Nil

    # Version ID of an object.
    property version_id : String | Nil

    # Specifies whether the object is (true) or is not (false) the latest version of an object.
    property is_latest : Bool | Nil

    # Date and time when the object was last modified.
    property last_modified : Time | Nil

    # Specifies the owner of the object.
    property owner : Owner | Nil

    # Specifies the restoration status of an object. Objects in certain storage classes must be
    # restored before they can be retrieved. For more information about these storage classes and how
    # to work with archived objects, see [ Working with archived
    # objects](https://docs.aws.amazon.com/AmazonS3/latest/userguide/archived-objects.html) in the
    # *Amazon S3 User Guide*.
    property restore_status : RestoreStatus | Nil

    def initialize(
      @e_tag : String | Nil = nil,
      @checksum_algorithm : Array(ChecksumAlgorithm) | Nil = nil,
      @checksum_type : ChecksumType | Nil = nil,
      @size : Int64 | Nil = nil,
      @storage_class : ObjectVersionStorageClass | Nil = nil,
      @key : String | Nil = nil,
      @version_id : String | Nil = nil,
      @is_latest : Bool | Nil = nil,
      @last_modified : Time | Nil = nil,
      @owner : Owner | Nil = nil,
      @restore_status : RestoreStatus | Nil = nil,
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

      (@checksum_algorithm || [] of ChecksumAlgorithm).each do |item|
        xml.element("ChecksumAlgorithm") { xml.text item.to_json_object_key }
      end

      if value = @checksum_type
        xml.element("ChecksumType") { xml.text value.to_json_object_key }
      end

      if value = @size
        xml.element("Size") { xml.text value.to_s }
      end

      if value = @storage_class
        xml.element("StorageClass") { xml.text value.to_json_object_key }
      end

      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @version_id
        xml.element("VersionId") { xml.text value }
      end

      if value = @is_latest
        xml.element("IsLatest") { xml.text Core::QueryValue.bool(value) }
      end

      if value = @last_modified
        xml.element("LastModified") { xml.text Core::QueryValue.time(value) }
      end

      if value = @owner
        xml.element("Owner") { value.build_xml(xml) }
      end

      if value = @restore_status
        xml.element("RestoreStatus") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        e_tag: Core::XMLValue.string(node.xpath_node("*[local-name()='ETag']")),
        checksum_algorithm: node.xpath_nodes("*[local-name()='ChecksumAlgorithm']").compact_map { |n| AS::ChecksumAlgorithm.from_json_object_key?(n.content) },
        checksum_type: (n = node.xpath_node("*[local-name()='ChecksumType']")) ? AS::ChecksumType.from_json_object_key?(n.content) : nil,
        size: Core::XMLValue.i64(node.xpath_node("*[local-name()='Size']")),
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::ObjectVersionStorageClass.from_json_object_key?(n.content) : nil,
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        version_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VersionId']")),
        is_latest: Core::XMLValue.bool(node.xpath_node("*[local-name()='IsLatest']")),
        last_modified: Core::XMLValue.time(node.xpath_node("*[local-name()='LastModified']")),
        owner: node.xpath_node("*[local-name()='Owner']").try { |n| Owner.from_xml(n) },
        restore_status: node.xpath_node("*[local-name()='RestoreStatus']").try { |n| RestoreStatus.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end

      if value = @owner
        value.validate!
      end

      if value = @restore_status
        value.validate!
      end
    end

    def_equals_and_hash(@e_tag, @checksum_algorithm, @checksum_type, @size, @storage_class, @key, @version_id, @is_latest, @last_modified, @owner, @restore_status)
  end
end
