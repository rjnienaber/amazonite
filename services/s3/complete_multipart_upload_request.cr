private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class CompleteMultipartUploadRequest
    # Name of the bucket to which the multipart upload was initiated.
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

    # Object key for which the multipart upload was initiated.
    property key : String = ""

    # The container for the multipart upload request information.
    property multipart_upload : CompletedMultipartUpload | Nil

    # ID for the initiated multipart upload.
    property upload_id : String = ""

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
    # checksum of the object. The `CRC64NVME` checksum is always a full object checksum. For more
    # information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
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
    # of the object. For more information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_sha512 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 128-bit `MD5` digest of
    # the object. For more information, see [Checking object integrity in the Amazon S3 User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_md5 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `XXHASH64`
    # checksum of the object. For more information, see [Checking object integrity in the Amazon S3
    # User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash64 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 64-bit `XXHASH3`
    # checksum of the object. For more information, see [Checking object integrity in the Amazon S3
    # User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash3 : String | Nil

    # This header can be used as a data integrity check to verify that the data received is the same
    # data that was originally sent. This header specifies the Base64 encoded, 128-bit `XXHASH128`
    # checksum of the object. For more information, see [Checking object integrity in the Amazon S3
    # User
    # Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html).
    property checksum_xxhash128 : String | Nil

    # This header specifies the checksum type of the object, which determines how part-level checksums
    # are combined to create an object-level checksum for multipart objects. You can use this header
    # as a data integrity check to verify that the checksum type that is received is the same checksum
    # that was specified. If the checksum type doesn’t match the checksum type that was specified for
    # the object during the `CreateMultipartUpload` request, it’ll result in a `BadDigest` error. For
    # more information, see Checking object integrity in the Amazon S3 User Guide.
    property checksum_type : ChecksumType | Nil

    # The expected total object size of the multipart upload request. If there’s a mismatch between
    # the specified object size value and the actual object size value, it results in an `HTTP 400
    # InvalidRequest` error.
    property mpu_object_size : Int64 | Nil

    property request_payer : RequestPayer | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # Uploads the object only if the ETag (entity tag) value provided during the WRITE operation
    # matches the ETag of the object in S3. If the ETag values do not match, the operation returns a
    # `412 Precondition Failed` error.
    #
    # If a conflicting operation occurs during the upload S3 returns a `409
    # ConditionalRequestConflict` response. On a 409 failure you should fetch the object's ETag,
    # re-initiate the multipart upload with `CreateMultipartUpload`, and re-upload each part.
    #
    # Expects the ETag value as a string.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232), or [Conditional
    # requests](https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html) in
    # the *Amazon S3 User Guide*.
    property if_match : String | Nil

    # Uploads the object only if the object key name does not already exist in the bucket specified.
    # Otherwise, Amazon S3 returns a `412 Precondition Failed` error.
    #
    # If a conflicting operation occurs during the upload S3 returns a `409
    # ConditionalRequestConflict` response. On a 409 failure you should re-initiate the multipart
    # upload with `CreateMultipartUpload` and re-upload each part.
    #
    # Expects the '*' (asterisk) character.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232), or [Conditional
    # requests](https://docs.aws.amazon.com/AmazonS3/latest/userguide/conditional-requests.html) in
    # the *Amazon S3 User Guide*.
    property if_none_match : String | Nil

    # The server-side encryption (SSE) algorithm used to encrypt the object. This parameter is
    # required only when the object was created using a checksum algorithm or if your bucket policy
    # requires the use of SSE-C. For more information, see [Protecting data using SSE-C
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerSideEncryptionCustomerKeys.html#ssec-require-condition-key)
    # in the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_algorithm : String | Nil

    # The server-side encryption (SSE) customer managed key. This parameter is needed only when the
    # object was created using a checksum algorithm. For more information, see [Protecting data using
    # SSE-C
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key : String | Nil

    # The MD5 server-side encryption (SSE) customer managed key. This parameter is needed only when
    # the object was created using a checksum algorithm. For more information, see [Protecting data
    # using SSE-C
    # keys](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key_md5 : String | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @upload_id : String,
      @multipart_upload : CompletedMultipartUpload | Nil = nil,
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
      @mpu_object_size : Int64 | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @if_match : String | Nil = nil,
      @if_none_match : String | Nil = nil,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
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

      if value = @multipart_upload
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @key, @multipart_upload, @upload_id, @checksum_crc32, @checksum_crc32c, @checksum_crc64nvme, @checksum_sha1, @checksum_sha256, @checksum_sha512, @checksum_md5, @checksum_xxhash64, @checksum_xxhash3, @checksum_xxhash128, @checksum_type, @mpu_object_size, @request_payer, @expected_bucket_owner, @if_match, @if_none_match, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5)
  end
end
