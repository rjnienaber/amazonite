private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # An object consists of data and its descriptive metadata.
  class Object
    # The name that you assign to an object. You use the object key to retrieve the object.
    property key : String | Nil

    # Creation date of the object.
    property last_modified : Time | Nil

    # The entity tag is a hash of the object. The ETag reflects changes only to the contents of an
    # object, not its metadata. The ETag may or may not be an MD5 digest of the object data. Whether
    # or not it is depends on how the object was created and how it is encrypted as described below:
    #
    # - Objects created by the PUT Object, POST Object, or Copy operation, or through the Amazon Web
    # Services Management Console, and are encrypted by SSE-S3 or plaintext, have ETags that are an
    # MD5 digest of their object data.
    #
    # - Objects created by the PUT Object, POST Object, or Copy operation, or through the Amazon Web
    # Services Management Console, and are encrypted by SSE-C or SSE-KMS, have ETags that are not an
    # MD5 digest of their object data.
    #
    # - If an object is created by either the Multipart Upload or Part Copy operation, the ETag is not
    # an MD5 digest, regardless of the method of encryption. If an object is larger than 16 MB, the
    # Amazon Web Services Management Console will upload or copy that object as a Multipart Upload,
    # and therefore the ETag will not be an MD5 digest.
    #
    # **Directory buckets** - MD5 is not supported by directory buckets.
    property e_tag : String | Nil

    # The algorithm that was used to create a checksum of the object.
    property checksum_algorithm : Array(ChecksumAlgorithm) | Nil

    # The checksum type that is used to calculate the object’s checksum value. For more information,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_type : ChecksumType | Nil

    # Size in bytes of the object
    property size : Int64 | Nil

    # The class of storage used to store the object.
    #
    # **Directory buckets** - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One
    # Zone storage class) in Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access
    # storage class) in Dedicated Local Zones.
    property storage_class : ObjectStorageClass | Nil

    # The owner of the object
    #
    # **Directory buckets** - The bucket owner is returned as the object owner.
    property owner : Owner | Nil

    # Specifies the restoration status of an object. Objects in certain storage classes must be
    # restored before they can be retrieved. For more information about these storage classes and how
    # to work with archived objects, see [ Working with archived
    # objects](https://docs.aws.amazon.com/AmazonS3/latest/userguide/archived-objects.html) in the
    # *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets. Directory buckets only support
    # `EXPRESS_ONEZONE` (the S3 Express One Zone storage class) in Availability Zones and `ONEZONE_IA`
    # (the S3 One Zone-Infrequent Access storage class) in Dedicated Local Zones.
    property restore_status : RestoreStatus | Nil

    def initialize(
      @key : String | Nil = nil,
      @last_modified : Time | Nil = nil,
      @e_tag : String | Nil = nil,
      @checksum_algorithm : Array(ChecksumAlgorithm) | Nil = nil,
      @checksum_type : ChecksumType | Nil = nil,
      @size : Int64 | Nil = nil,
      @storage_class : ObjectStorageClass | Nil = nil,
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
      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @last_modified
        xml.element("LastModified") { xml.text Core::QueryValue.time(value) }
      end

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

      if value = @owner
        xml.element("Owner") { value.build_xml(xml) }
      end

      if value = @restore_status
        xml.element("RestoreStatus") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        last_modified: Core::XMLValue.time(node.xpath_node("*[local-name()='LastModified']")),
        e_tag: Core::XMLValue.string(node.xpath_node("*[local-name()='ETag']")),
        checksum_algorithm: node.xpath_nodes("*[local-name()='ChecksumAlgorithm']").compact_map { |n| AS::ChecksumAlgorithm.from_json_object_key?(n.content) },
        checksum_type: (n = node.xpath_node("*[local-name()='ChecksumType']")) ? AS::ChecksumType.from_json_object_key?(n.content) : nil,
        size: Core::XMLValue.i64(node.xpath_node("*[local-name()='Size']")),
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::ObjectStorageClass.from_json_object_key?(n.content) : nil,
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

    def_equals_and_hash(@key, @last_modified, @e_tag, @checksum_algorithm, @checksum_type, @size, @storage_class, @owner, @restore_status)
  end
end
