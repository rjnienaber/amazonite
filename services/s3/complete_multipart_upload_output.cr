private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class CompleteMultipartUploadOutput
    # The URI that identifies the newly created object.
    property location : String | Nil

    # The name of the bucket that contains the newly created object. Does not return the access point
    # ARN or access point alias if used.
    #
    # Access points are not supported by directory buckets.
    property bucket : String | Nil

    # The object key of the newly created object.
    property key : String | Nil

    # If the object expiration is configured, this will contain the expiration date (`expiry-date`)
    # and rule ID (`rule-id`). The value of `rule-id` is URL-encoded.
    #
    # This functionality is not supported for directory buckets.
    property expiration : String | Nil

    # Entity tag that identifies the newly created object's data. Objects with different object data
    # will have different entity tags. The entity tag is an opaque string. The entity tag may or may
    # not be an MD5 digest of the object data. If the entity tag is not an MD5 digest of the object
    # data, it will contain one or more nonhexadecimal characters and/or will consist of less than 32
    # or more than 32 hexadecimal digits. For more information about how the entity tag is calculated,
    # see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property e_tag : String | Nil

    # The Base64 encoded, 32-bit `CRC32 checksum` of the object. This checksum is only present if the
    # checksum was uploaded with the object. When you use an API operation on an object that was
    # uploaded using multipart uploads, this value may not be a direct checksum value of the full
    # object. Instead, it's a calculation based on the checksum values of each individual part. For
    # more information about how checksums are calculated with multipart uploads, see [ Checking
    # object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32 : String | Nil

    # The Base64 encoded, 32-bit `CRC32C` checksum of the object. This checksum is only present if the
    # checksum was uploaded with the object. When you use an API operation on an object that was
    # uploaded using multipart uploads, this value may not be a direct checksum value of the full
    # object. Instead, it's a calculation based on the checksum values of each individual part. For
    # more information about how checksums are calculated with multipart uploads, see [ Checking
    # object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32c : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `CRC64NVME`
    # checksum of the object. The `CRC64NVME` checksum is always a full object checksum. For more
    # information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_crc64nvme : String | Nil

    # The Base64 encoded, 160-bit `SHA1` digest of the object. This checksum is only present if the
    # checksum was uploaded with the object. When you use the API operation on an object that was
    # uploaded using multipart uploads, this value may not be a direct checksum value of the full
    # object. Instead, it's a calculation based on the checksum values of each individual part. For
    # more information about how checksums are calculated with multipart uploads, see [ Checking
    # object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums)
    # in the *Amazon S3 User Guide*.
    property checksum_sha1 : String | Nil

    # The Base64 encoded, 256-bit `SHA256` digest of the object. This checksum is only present if the
    # checksum was uploaded with the object. When you use an API operation on an object that was
    # uploaded using multipart uploads, this value may not be a direct checksum value of the full
    # object. Instead, it's a calculation based on the checksum values of each individual part. For
    # more information about how checksums are calculated with multipart uploads, see [ Checking
    # object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html#large-object-checksums)
    # in the *Amazon S3 User Guide*.
    property checksum_sha256 : String | Nil

    # The Base64 encoded, 512-bit `SHA512` digest of the object. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_sha512 : String | Nil

    # The Base64 encoded, 128-bit `MD5` digest of the object. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_md5 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH64` checksum of the object. For more information, see
    # [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash64 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH3` checksum of the object. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash3 : String | Nil

    # The Base64 encoded, 128-bit `XXHASH128` checksum of the object. For more information, see
    # [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash128 : String | Nil

    # The checksum type, which determines how part-level checksums are combined to create an
    # object-level checksum for multipart objects. You can use this header as a data integrity check
    # to verify that the checksum type that is received is the same checksum type that was specified
    # during the `CreateMultipartUpload` request. For more information, see [Checking object integrity
    # in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_type : ChecksumType | Nil

    # The server-side encryption algorithm used when storing this object in Amazon S3.
    #
    # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid
    # server side encryption option is `aws:fsx`.
    property server_side_encryption : ServerSideEncryption | Nil

    # Version ID of the newly created object, in case the bucket has versioning turned on.
    #
    # This functionality is not supported for directory buckets.
    property version_id : String | Nil

    # If present, indicates the ID of the KMS key that was used for object encryption.
    property ssekms_key_id : String | Nil

    # Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with Key
    # Management Service (KMS) keys (SSE-KMS).
    property bucket_key_enabled : Bool | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @location : String | Nil = nil,
      @bucket : String | Nil = nil,
      @key : String | Nil = nil,
      @expiration : String | Nil = nil,
      @e_tag : String | Nil = nil,
      @checksum_crc32 : String | Nil = nil,
      @checksum_crc32c : String | Nil = nil,
      @checksum_crc64nvme : String | Nil = nil,
      @checksum_sha1 : String | Nil = nil,
      @checksum_sha256 : String | Nil = nil,
      @checksum_sha512 : String | Nil = nil,
      @checksum_md5 : String | Nil = nil,
      @checksum_xxhash64 : String | Nil = nil,
      @checksum_xxhash3 : String | Nil = nil,
      @checksum_xxhash128 : String | Nil = nil,
      @checksum_type : ChecksumType | Nil = nil,
      @server_side_encryption : ServerSideEncryption | Nil = nil,
      @version_id : String | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
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
      if value = @location
        xml.element("Location") { xml.text value }
      end

      if value = @bucket
        xml.element("Bucket") { xml.text value }
      end

      if value = @key
        xml.element("Key") { xml.text value }
      end

      if value = @e_tag
        xml.element("ETag") { xml.text value }
      end

      if value = @checksum_crc32
        xml.element("ChecksumCRC32") { xml.text value }
      end

      if value = @checksum_crc32c
        xml.element("ChecksumCRC32C") { xml.text value }
      end

      if value = @checksum_crc64nvme
        xml.element("ChecksumCRC64NVME") { xml.text value }
      end

      if value = @checksum_sha1
        xml.element("ChecksumSHA1") { xml.text value }
      end

      if value = @checksum_sha256
        xml.element("ChecksumSHA256") { xml.text value }
      end

      if value = @checksum_sha512
        xml.element("ChecksumSHA512") { xml.text value }
      end

      if value = @checksum_md5
        xml.element("ChecksumMD5") { xml.text value }
      end

      if value = @checksum_xxhash64
        xml.element("ChecksumXXHASH64") { xml.text value }
      end

      if value = @checksum_xxhash3
        xml.element("ChecksumXXHASH3") { xml.text value }
      end

      if value = @checksum_xxhash128
        xml.element("ChecksumXXHASH128") { xml.text value }
      end

      if value = @checksum_type
        xml.element("ChecksumType") { xml.text value.to_json_object_key }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        location: Core::XMLValue.string(node.xpath_node("*[local-name()='Location']")),
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")),
        key: Core::XMLValue.string(node.xpath_node("*[local-name()='Key']")),
        e_tag: Core::XMLValue.string(node.xpath_node("*[local-name()='ETag']")),
        checksum_crc32: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumCRC32']")),
        checksum_crc32c: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumCRC32C']")),
        checksum_crc64nvme: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumCRC64NVME']")),
        checksum_sha1: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumSHA1']")),
        checksum_sha256: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumSHA256']")),
        checksum_sha512: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumSHA512']")),
        checksum_md5: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumMD5']")),
        checksum_xxhash64: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumXXHASH64']")),
        checksum_xxhash3: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumXXHASH3']")),
        checksum_xxhash128: Core::XMLValue.string(node.xpath_node("*[local-name()='ChecksumXXHASH128']")),
        checksum_type: (n = node.xpath_node("*[local-name()='ChecksumType']")) ? AS::ChecksumType.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@location, @bucket, @key, @expiration, @e_tag, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @checksum_type, @server_side_encryption, @version_id, @ssekms_key_id, @bucket_key_enabled, @request_charged)
  end
end
