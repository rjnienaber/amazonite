private alias AS = Amazonite::S3

module Amazonite::S3
  class UploadPartOutput
    # The server-side encryption algorithm used when you store this object in Amazon S3 or Amazon FSx.
    #
    # When accessing data stored in Amazon FSx file systems using S3 access points, the only valid
    # server side encryption option is `aws:fsx`.
    property server_side_encryption : ServerSideEncryption | Nil

    # Entity tag for the uploaded object.
    property e_tag : String | Nil

    # The Base64 encoded, 32-bit `CRC32` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32 : String | Nil

    # The Base64 encoded, 32-bit `CRC32C` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32c : String | Nil

    # The Base64 encoded, 64-bit `CRC64NVME` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc64nvme : String | Nil

    # The Base64 encoded, 160-bit `SHA1` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha1 : String | Nil

    # The Base64 encoded, 256-bit `SHA256` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha256 : String | Nil

    # The Base64 encoded, 512-bit `SHA512` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha512 : String | Nil

    # The Base64 encoded, 128-bit `MD5` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_md5 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH64` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash64 : String | Nil

    # The Base64 encoded, 64-bit `XXHASH3` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash3 : String | Nil

    # The Base64 encoded, 128-bit `XXHASH128` checksum of the part. This will only be present if the
    # checksum was provided in the request. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash128 : String | Nil

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

    # Indicates whether the multipart upload uses an S3 Bucket Key for server-side encryption with Key
    # Management Service (KMS) keys (SSE-KMS).
    property bucket_key_enabled : Bool | Nil

    property request_charged : RequestCharged | Nil

    def initialize(
      @server_side_encryption : ServerSideEncryption | Nil = nil,
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
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@server_side_encryption, @e_tag, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @sse_customer_algorithm, @sse_customer_key_md5, @ssekms_key_id, @bucket_key_enabled, @request_charged)
  end
end
