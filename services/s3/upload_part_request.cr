private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class UploadPartRequest
    # Object data.
    property body : String | Nil

    # The name of the bucket to which the multipart upload was initiated.
    #
    # **Directory buckets** - When you use this operation with a directory bucket, you must use
    # virtual-hosted-style requests in the format `
    # *Bucket-name*.s3express-*zone-id*.*region-code*.amazonaws.com`. Path-style requests are not
    # supported. Directory bucket names must be unique in the chosen Zone (Availability Zone or Local
    # Zone). Bucket names must follow the format ` *bucket-base-name*--*zone-id*--x-s3` (for example,
    # ` *amzn-s3-demo-bucket*--*usw2-az1*--x-s3`). For information about bucket naming restrictions,
    # see [Directory bucket naming
    # rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html)
    # in the *Amazon S3 User Guide*.
    #
    # **Access points** - When you use this action with an access point for general purpose buckets,
    # you must provide the alias of the access point in place of the bucket name or specify the access
    # point ARN. When you use this action with an access point for directory buckets, you must provide
    # the access point name in place of the bucket name. When using the access point ARN, you must
    # direct requests to the access point hostname. The access point hostname takes the form
    # *AccessPointName*-*AccountId*.s3-accesspoint.*Region*.amazonaws.com. When using this action with
    # an access point through the Amazon Web Services SDKs, you provide the access point ARN in place
    # of the bucket name. For more information about access point ARNs, see [Using access
    # points](https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-access-points.html) in the
    # *Amazon S3 User Guide*.
    #
    # Object Lambda access points are not supported by directory buckets.
    #
    # **S3 on Outposts** - When you use this action with S3 on Outposts, you must direct requests to
    # the S3 on Outposts hostname. The S3 on Outposts hostname takes the form `
    # *AccessPointName*-*AccountId*.*outpostID*.s3-outposts.*Region*.amazonaws.com`. When you use this
    # action with S3 on Outposts, the destination bucket must be the Outposts access point ARN or the
    # access point alias. For more information about S3 on Outposts, see [What is S3 on
    # Outposts?](https://docs.aws.amazon.com/AmazonS3/latest/userguide/S3onOutposts.html) in the
    # *Amazon S3 User Guide*.
    property bucket : String = ""

    # Size of the body in bytes. This parameter is useful when the size of the body cannot be
    # determined automatically.
    property content_length : Int64 | Nil

    # The Base64 encoded 128-bit MD5 digest of the part data. This parameter is auto-populated when
    # using the command from the CLI. This parameter is required if object lock parameters are
    # specified.
    #
    # This functionality is not supported for directory buckets.
    property content_md5 : String | Nil

    # Indicates the algorithm used to create the checksum for the object when you use the SDK. This
    # header will not provide any additional functionality if you don't use the SDK. When you send
    # this header, there must be a corresponding `x-amz-checksum` or `x-amz-trailer` header sent.
    # Otherwise, Amazon S3 fails the request with the HTTP status code `400 Bad Request`. For more
    # information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    #
    # If you provide an individual checksum, Amazon S3 ignores any provided `ChecksumAlgorithm`
    # parameter.
    #
    # This checksum algorithm must be the same for all parts and it match the checksum value supplied
    # in the `CreateMultipartUpload` request.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 32-bit `CRC32` checksum
    # of the object. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 32-bit `CRC32C`
    # checksum of the object. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc32c : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `CRC64NVME`
    # checksum of the part. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_crc64nvme : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 160-bit `SHA1` digest
    # of the object. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha1 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 256-bit `SHA256` digest
    # of the object. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha256 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 512-bit `SHA512` digest
    # of the part. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_sha512 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 128-bit `MD5` digest of
    # the part. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_md5 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `XXHASH64`
    # checksum of the part. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash64 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `XXHASH3`
    # checksum of the part. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash3 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 128-bit `XXHASH128`
    # checksum of the part. For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_xxhash128 : String | Nil

    # Object key for which the multipart upload was initiated.
    property key : String = ""

    # Part number of part being uploaded. This is a positive integer between 1 and 10,000.
    property part_number : Int32 = 0

    # Upload ID identifying the multipart upload whose part is being uploaded.
    property upload_id : String = ""

    # Specifies the algorithm to use when encrypting the object (for example, AES256).
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_algorithm : String | Nil

    # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # `x-amz-server-side-encryption-customer-algorithm header`. This must be the same encryption key
    # specified in the initiate multipart upload request.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key : String | Nil

    # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key_md5 : String | Nil

    property request_payer : RequestPayer | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @part_number : Int32,
      @upload_id : String,
      @body : String | Nil = nil,
      @content_length : Int64 | Nil = nil,
      @content_md5 : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
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
      @sse_customer_key : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
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
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@body, @bucket, @content_length, @content_md5, @checksum_algorithm, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @key, @part_number, @upload_id, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5, @request_payer, @expected_bucket_owner)
  end
end
