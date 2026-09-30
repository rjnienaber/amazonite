private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class UploadPartCopyRequest
    # The bucket name.
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
    # Copying objects across different Amazon Web Services Regions isn't supported when the source or
    # destination bucket is in Amazon Web Services Local Zones. The source and destination buckets
    # must have the same parent Amazon Web Services Region. Otherwise, you get an HTTP `400 Bad
    # Request` error with the error code `InvalidRequest`.
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

    # Specifies the source object for the copy operation. You specify the value in one of two formats,
    # depending on whether you want to access the source object through an [access
    # point](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points.html):
    #
    # - For objects not accessed through an access point, specify the name of the source bucket and
    # key of the source object, separated by a slash (/). For example, to copy the object
    # `reports/january.pdf` from the bucket `awsexamplebucket`, use
    # `awsexamplebucket/reports/january.pdf`. The value must be URL-encoded.
    #
    # - For objects accessed through access points, specify the Amazon Resource Name (ARN) of the
    # object as accessed through the access point, in the format `arn:aws:s3:::accesspoint//object/`.
    # For example, to copy the object `reports/january.pdf` through access point `my-access-point`
    # owned by account `123456789012` in Region `us-west-2`, use the URL encoding of
    # `arn:aws:s3:us-west-2:123456789012:accesspoint/my-access-point/object/reports/january.pdf`. The
    # value must be URL encoded.
    #
    # - Amazon S3 supports copy operations using Access points only when the source and destination
    # buckets are in the same Amazon Web Services Region.
    #
    # - Access points are not supported by directory buckets.
    #
    # Alternatively, for objects accessed through Amazon S3 on Outposts, specify the ARN of the object
    # as accessed in the format `arn:aws:s3-outposts:::outpost//object/`. For example, to copy the
    # object `reports/january.pdf` through outpost `my-outpost` owned by account `123456789012` in
    # Region `us-west-2`, use the URL encoding of
    # `arn:aws:s3-outposts:us-west-2:123456789012:outpost/my-outpost/object/reports/january.pdf`. The
    # value must be URL-encoded.
    #
    # If your bucket has versioning enabled, you could have multiple versions of the same object. By
    # default, `x-amz-copy-source` identifies the current version of the source object to copy. To
    # copy a specific version of the source object to copy, append `?versionId=` to the
    # `x-amz-copy-source` request header (for example, `x-amz-copy-source:
    # /awsexamplebucket/reports/january.pdf?versionId=QUpfdndhfd8438MNFDN93jdnJFkdmqnh893`).
    #
    # If the current version is a delete marker and you don't specify a versionId in the
    # `x-amz-copy-source` request header, Amazon S3 returns a `404 Not Found` error, because the
    # object does not exist. If you specify versionId in the `x-amz-copy-source` and the versionId is
    # a delete marker, Amazon S3 returns an HTTP `400 Bad Request` error, because you are not allowed
    # to specify a delete marker as a version for the `x-amz-copy-source`.
    #
    # **Directory buckets** - S3 Versioning isn't enabled and supported for directory buckets.
    property copy_source : String = ""

    # Copies the object if its entity tag (ETag) matches the specified tag.
    #
    # If both of the `x-amz-copy-source-if-match` and `x-amz-copy-source-if-unmodified-since` headers
    # are present in the request as follows:
    #
    # `x-amz-copy-source-if-match` condition evaluates to `true`, and;
    #
    # `x-amz-copy-source-if-unmodified-since` condition evaluates to `false`;
    #
    # Amazon S3 returns `200 OK` and copies the data.
    property copy_source_if_match : String | Nil

    # Copies the object if it has been modified since the specified time.
    #
    # If both of the `x-amz-copy-source-if-none-match` and `x-amz-copy-source-if-modified-since`
    # headers are present in the request as follows:
    #
    # `x-amz-copy-source-if-none-match` condition evaluates to `false`, and;
    #
    # `x-amz-copy-source-if-modified-since` condition evaluates to `true`;
    #
    # Amazon S3 returns `412 Precondition Failed` response code.
    property copy_source_if_modified_since : Time | Nil

    # Copies the object if its entity tag (ETag) is different than the specified ETag.
    #
    # If both of the `x-amz-copy-source-if-none-match` and `x-amz-copy-source-if-modified-since`
    # headers are present in the request as follows:
    #
    # `x-amz-copy-source-if-none-match` condition evaluates to `false`, and;
    #
    # `x-amz-copy-source-if-modified-since` condition evaluates to `true`;
    #
    # Amazon S3 returns `412 Precondition Failed` response code.
    property copy_source_if_none_match : String | Nil

    # Copies the object if it hasn't been modified since the specified time.
    #
    # If both of the `x-amz-copy-source-if-match` and `x-amz-copy-source-if-unmodified-since` headers
    # are present in the request as follows:
    #
    # `x-amz-copy-source-if-match` condition evaluates to `true`, and;
    #
    # `x-amz-copy-source-if-unmodified-since` condition evaluates to `false`;
    #
    # Amazon S3 returns `200 OK` and copies the data.
    property copy_source_if_unmodified_since : Time | Nil

    # The range of bytes to copy from the source object. The range value must use the form
    # bytes=first-last, where the first and last are the zero-based byte offsets to copy. For example,
    # bytes=0-9 indicates that you want to copy the first 10 bytes of the source. You can copy a range
    # only if the source object is greater than 5 MB.
    property copy_source_range : String | Nil

    # Object key for which the multipart upload was initiated.
    property key : String = ""

    # Part number of part being copied. This is a positive integer between 1 and 10,000.
    property part_number : Int32 = 0

    # Upload ID identifying the multipart upload whose part is being copied.
    property upload_id : String = ""

    # Specifies the algorithm to use when encrypting the object (for example, AES256).
    #
    # This functionality is not supported when the destination bucket is a directory bucket.
    property sse_customer_algorithm : String | Nil

    # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # `x-amz-server-side-encryption-customer-algorithm` header. This must be the same encryption key
    # specified in the initiate multipart upload request.
    #
    # This functionality is not supported when the destination bucket is a directory bucket.
    property sse_customer_key : String | Nil

    # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.
    #
    # This functionality is not supported when the destination bucket is a directory bucket.
    property sse_customer_key_md5 : String | Nil

    # Specifies the algorithm to use when decrypting the source object (for example, `AES256`).
    #
    # This functionality is not supported when the source object is in a directory bucket.
    property copy_source_sse_customer_algorithm : String | Nil

    # Specifies the customer-provided encryption key for Amazon S3 to use to decrypt the source
    # object. The encryption key provided in this header must be one that was used when the source
    # object was created.
    #
    # This functionality is not supported when the source object is in a directory bucket.
    property copy_source_sse_customer_key : String | Nil

    # Specifies the 128-bit MD5 digest of the encryption key according to RFC 1321. Amazon S3 uses
    # this header for a message integrity check to ensure that the encryption key was transmitted
    # without error.
    #
    # This functionality is not supported when the source object is in a directory bucket.
    property copy_source_sse_customer_key_md5 : String | Nil

    property request_payer : RequestPayer | Nil

    # The account ID of the expected destination bucket owner. If the account ID that you provide does
    # not match the actual owner of the destination bucket, the request fails with the HTTP status
    # code `403 Forbidden` (access denied).
    property expected_bucket_owner : String | Nil

    # The account ID of the expected source bucket owner. If the account ID that you provide does not
    # match the actual owner of the source bucket, the request fails with the HTTP status code `403
    # Forbidden` (access denied).
    property expected_source_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @copy_source : String,
      @key : String,
      @part_number : Int32,
      @upload_id : String,
      @copy_source_if_match : String | Nil = nil,
      @copy_source_if_modified_since : Time | Nil = nil,
      @copy_source_if_none_match : String | Nil = nil,
      @copy_source_if_unmodified_since : Time | Nil = nil,
      @copy_source_range : String | Nil = nil,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @copy_source_sse_customer_algorithm : String | Nil = nil,
      @copy_source_sse_customer_key : String | Nil = nil,
      @copy_source_sse_customer_key_md5 : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @expected_source_bucket_owner : String | Nil = nil,
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
      if value = @copy_source
        raise Core::ValidationError.new("CopySource does not match the required pattern") unless value.matches?(Regex.new("^\\/?.+\\/.+$"))
      end

      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@bucket, @copy_source, @copy_source_if_match, @copy_source_if_modified_since, @copy_source_if_none_match, @copy_source_if_unmodified_since, @copy_source_range, @key, @part_number, @upload_id, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5, @copy_source_sse_customer_algorithm, @copy_source_sse_customer_key, @copy_source_sse_customer_key_md5, @request_payer, @expected_bucket_owner, @expected_source_bucket_owner)
  end
end
