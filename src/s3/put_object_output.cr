private alias AS = Amazonite::S3

module Amazonite::S3
  class PutObjectOutput
    # If the expiration is configured for the object (see
    # [PutBucketLifecycleConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycleConfiguration.html))
    # in the *Amazon S3 User Guide*, the response includes this header. It includes the `expiry-date`
    # and `rule-id` key-value pairs that provide information about object expiration. The value of the
    # `rule-id` is URL-encoded.
    #
    # Object expiration information is not returned in directory buckets and this header returns the
    # value "`NotImplemented`" in all responses for directory buckets.
    property expiration : String | Nil

    # Entity tag for the uploaded object.
    #
    # **General purpose buckets ** - To ensure that data is not corrupted traversing the network, for
    # objects where the ETag is the MD5 digest of the object, you can calculate the MD5 while putting
    # an object to Amazon S3 and compare the returned ETag to the calculated MD5 value.
    #
    # **Directory buckets ** - The ETag for the object in a directory bucket isn't the MD5 digest of
    # the object.
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

    # The Base64 encoded, 64-bit `CRC64NVME` checksum of the object. This header is present if the
    # object was uploaded with the `CRC64NVME` checksum algorithm, or if it was uploaded without a
    # checksum (and Amazon S3 added the default checksum, `CRC64NVME`, to the uploaded object). For
    # more information about how checksums are calculated with multipart uploads, see [Checking object
    # integrity in the Amazon S3 User
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

    # The Base64 encoded, 512-bit `SHA512` digest of the object. This header is present if the object
    # was uploaded with the `SHA512` checksum algorithm. For more information, see [Checking object
    # integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_sha512 : String | Nil

    # The Base64 encoded, 128-bit `MD5` digest of the object. This header is present if the object was
    # uploaded with the `MD5` checksum algorithm. For more information, see [Checking object integrity
    # in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_md5 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH64` checksum of the object. This header is present if the
    # object was uploaded with the `XXHASH64` checksum algorithm. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash64 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH3` checksum of the object. This header is present if the
    # object was uploaded with the `XXHASH3` checksum algorithm. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash3 : String | Nil

    # The Base64 encoded, 128-bit `XXHASH128` checksum of the object. This header is present if the
    # object was uploaded with the `XXHASH128` checksum algorithm. For more information, see [Checking
    # object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash128 : String | Nil

    # This header specifies the checksum type of the object, which determines how part-level checksums
    # are combined to create an object-level checksum for multipart objects. For `PutObject` uploads,
    # the checksum type is always `FULL_OBJECT`. You can use this header as a data integrity check to
    # verify that the checksum type that is received is the same checksum that was specified. For more
    # information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_type : ChecksumType | Nil

    # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
    #
    # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid
    # server side encryption option is `aws:fsx`.
    property server_side_encryption : ServerSideEncryption | Nil

    # Version ID of the object.
    #
    # If you enable versioning for a bucket, Amazon S3 automatically generates a unique version ID for
    # the object being stored. Amazon S3 returns this ID in the response. When you enable versioning
    # for a bucket, if Amazon S3 receives multiple write requests for the same object simultaneously,
    # it stores all of the objects. For more information about versioning, see [Adding Objects to
    # Versioning-Enabled
    # Buckets](https://docs.aws.amazon.com/AmazonS3/latest/dev/AddingObjectstoVersioningEnabledBuckets.html)
    # in the *Amazon S3 User Guide*. For information about returning the versioning state of a bucket,
    # see
    # [GetBucketVersioning](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html).
    #
    # This functionality is not supported for directory buckets.
    property version_id : String | Nil

    # If server-side encryption with a customer-provided encryption key was requested, the response
    # will include this header to confirm the encryption algorithm that's used.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_algorithm : String | Nil

    # If server-side encryption with a customer-provided encryption key was requested, the response
    # will include this header to provide the round-trip message integrity verification of the
    # customer-provided encryption key.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key_md5 : String | Nil

    # If present, indicates the ID of the KMS key that was used for object encryption.
    property ssekms_key_id : String | Nil

    # If present, indicates the Amazon Web Services KMS Encryption Context to use for object
    # encryption. The value of this header is a Base64 encoded string of a UTF-8 encoded JSON, which
    # contains the encryption context as key-value pairs. This value is stored as object metadata and
    # automatically gets passed on to Amazon Web Services KMS for future `GetObject` operations on
    # this object.
    property ssekms_encryption_context : String | Nil

    # Indicates whether the uploaded object uses an S3 Bucket Key for server-side encryption with Key
    # Management Service (KMS) keys (SSE-KMS).
    property bucket_key_enabled : Bool | Nil

    # The size of the object in bytes. This value is only be present if you append to an object.
    #
    # This functionality is only supported for objects in the Amazon S3 Express One Zone storage class
    # in directory buckets.
    property size : Int64 | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
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
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @ssekms_key_id : String | Nil = nil,
      @ssekms_encryption_context : String | Nil = nil,
      @bucket_key_enabled : Bool | Nil = nil,
      @size : Int64 | Nil = nil,
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

    def_equals_and_hash(@expiration, @e_tag, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @checksum_type, @server_side_encryption, @version_id, @sse_customer_algorithm, @sse_customer_key_md5, @ssekms_key_id, @ssekms_encryption_context, @bucket_key_enabled, @size, @request_charged)
  end
end
