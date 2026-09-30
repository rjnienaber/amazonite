private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Container for the `MultipartUpload` for the Amazon S3 object.
  class MultipartUpload
    # Upload ID that identifies the multipart upload.
    property upload_id : String | Nil

    # Key of the object for which the multipart upload was initiated.
    property key : String | Nil

    # Date and time at which the multipart upload was initiated.
    property initiated : Time | Nil

    # The class of storage used to store the object.
    #
    # **Directory buckets** - Directory buckets only support `EXPRESS_ONEZONE` (the S3 Express One
    # Zone storage class) in Availability Zones and `ONEZONE_IA` (the S3 One Zone-Infrequent Access
    # storage class) in Dedicated Local Zones.
    property storage_class : StorageClass | Nil

    # Specifies the owner of the object that is part of the multipart upload.
    #
    # **Directory buckets** - The bucket owner is returned as the object owner for all the objects.
    property owner : Owner | Nil

    # Identifies who initiated the multipart upload.
    property initiator : Initiator | Nil

    # The algorithm that was used to create a checksum of the object.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # The checksum type that is used to calculate the object’s checksum value. For more information,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_type : ChecksumType | Nil

    def initialize(
      @upload_id : String | Nil = nil,
      @key : String | Nil = nil,
      @initiated : Time | Nil = nil,
      @storage_class : StorageClass | Nil = nil,
      @owner : Owner | Nil = nil,
      @initiator : Initiator | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @checksum_type : ChecksumType | Nil = nil,
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
      if value = @upload_id
        xml.element("UploadId") { xml.text value }
      end

      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @initiated
        xml.element("Initiated") { xml.text Core::QueryValue.time(value) }
      end

      if value = @storage_class
        xml.element("StorageClass") { xml.text value.to_json_object_key }
      end

      if value = @owner
        xml.element("Owner") { value.build_xml(xml) }
      end

      if value = @initiator
        xml.element("Initiator") { value.build_xml(xml) }
      end

      if value = @checksum_algorithm
        xml.element("ChecksumAlgorithm") { xml.text value.to_json_object_key }
      end

      if value = @checksum_type
        xml.element("ChecksumType") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        upload_id: Core::XMLValue.string(node.xpath_node("*[local-name()='UploadId']")),
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        initiated: Core::XMLValue.time(node.xpath_node("*[local-name()='Initiated']")),
        storage_class: (n = node.xpath_node("*[local-name()='StorageClass']")) ? AS::StorageClass.from_json_object_key?(n.content) : nil,
        owner: node.xpath_node("*[local-name()='Owner']").try { |n| Owner.from_xml(n) },
        initiator: node.xpath_node("*[local-name()='Initiator']").try { |n| Initiator.from_xml(n) },
        checksum_algorithm: (n = node.xpath_node("*[local-name()='ChecksumAlgorithm']")) ? AS::ChecksumAlgorithm.from_json_object_key?(n.content) : nil,
        checksum_type: (n = node.xpath_node("*[local-name()='ChecksumType']")) ? AS::ChecksumType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end

      if value = @owner
        value.validate!
      end

      if value = @initiator
        value.validate!
      end
    end

    def_equals_and_hash(@upload_id, @key, @initiated, @storage_class, @owner, @initiator, @checksum_algorithm, @checksum_type)
  end
end
