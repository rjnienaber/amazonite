private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectRequest
    # The bucket name containing the object.
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
    # **Object Lambda access points** - When you use this action with an Object Lambda access point,
    # you must direct requests to the Object Lambda access point hostname. The Object Lambda access
    # point hostname takes the form
    # *AccessPointName*-*AccountId*.s3-object-lambda.*Region*.amazonaws.com.
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

    # Return the object only if its entity tag (ETag) is the same as the one specified in this header;
    # otherwise, return a `412 Precondition Failed` error.
    #
    # If both of the `If-Match` and `If-Unmodified-Since` headers are present in the request as
    # follows: `If-Match` condition evaluates to `true`, and; `If-Unmodified-Since` condition
    # evaluates to `false`; then, S3 returns `200 OK` and the data requested.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_match : String | Nil

    # Return the object only if it has been modified since the specified time; otherwise, return a
    # `304 Not Modified` error.
    #
    # If both of the `If-None-Match` and `If-Modified-Since` headers are present in the request as
    # follows:` If-None-Match` condition evaluates to `false`, and; `If-Modified-Since` condition
    # evaluates to `true`; then, S3 returns `304 Not Modified` status code.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_modified_since : Time | Nil

    # Return the object only if its entity tag (ETag) is different from the one specified in this
    # header; otherwise, return a `304 Not Modified` error.
    #
    # If both of the `If-None-Match` and `If-Modified-Since` headers are present in the request as
    # follows:` If-None-Match` condition evaluates to `false`, and; `If-Modified-Since` condition
    # evaluates to `true`; then, S3 returns `304 Not Modified` HTTP status code.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_none_match : String | Nil

    # Return the object only if it has not been modified since the specified time; otherwise, return a
    # `412 Precondition Failed` error.
    #
    # If both of the `If-Match` and `If-Unmodified-Since` headers are present in the request as
    # follows: `If-Match` condition evaluates to `true`, and; `If-Unmodified-Since` condition
    # evaluates to `false`; then, S3 returns `200 OK` and the data requested.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_unmodified_since : Time | Nil

    # Key of the object to get.
    property key : String = ""

    # Downloads the specified byte range of an object. For more information about the HTTP Range
    # header, see
    # [https://www.rfc-editor.org/rfc/rfc9110.html#name-range](https://www.rfc-editor.org/rfc/rfc9110.html#name-range).
    #
    # Amazon S3 doesn't support retrieving multiple ranges of data per `GET` request.
    property range : String | Nil

    # Sets the `Cache-Control` header of the response.
    property response_cache_control : String | Nil

    # Sets the `Content-Disposition` header of the response.
    property response_content_disposition : String | Nil

    # Sets the `Content-Encoding` header of the response.
    property response_content_encoding : String | Nil

    # Sets the `Content-Language` header of the response.
    property response_content_language : String | Nil

    # Sets the `Content-Type` header of the response.
    property response_content_type : String | Nil

    # Sets the `Expires` header of the response.
    property response_expires : Time | Nil

    # Version ID used to reference a specific version of the object.
    #
    # By default, the `GetObject` operation returns the current version of an object. To return a
    # different version, use the `versionId` subresource.
    #
    # - If you include a `versionId` in your request header, you must have the `s3:GetObjectVersion`
    # permission to access a specific version of an object. The `s3:GetObject` permission is not
    # required in this scenario.
    #
    # - If you request the current version of an object without a specific `versionId` in the request
    # header, only the `s3:GetObject` permission is required. The `s3:GetObjectVersion` permission is
    # not required in this scenario.
    #
    # - **Directory buckets** - S3 Versioning isn't enabled and supported for directory buckets. For
    # this API operation, only the `null` value of the version ID is supported by directory buckets.
    # You can only specify `null` to the `versionId` query parameter in the request.
    #
    # For more information about versioning, see
    # [PutBucketVersioning](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketVersioning.html).
    property version_id : String | Nil

    # Specifies the algorithm to use when decrypting the object (for example, `AES256`).
    #
    # If you encrypt an object by using server-side encryption with customer-provided encryption keys
    # (SSE-C) when you store the object in Amazon S3, then when you GET the object, you must use the
    # following headers:
    #
    # - `x-amz-server-side-encryption-customer-algorithm`
    #
    # - `x-amz-server-side-encryption-customer-key`
    #
    # - `x-amz-server-side-encryption-customer-key-MD5`
    #
    # For more information about SSE-C, see [Server-Side Encryption (Using Customer-Provided
    # Encryption
    # Keys)](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_algorithm : String | Nil

    # Specifies the customer-provided encryption key that you originally provided for Amazon S3 to
    # encrypt the data before storing it. This value is used to decrypt the object when recovering it
    # and must match the one used when storing the data. The key must be appropriate for use with the
    # algorithm specified in the `x-amz-server-side-encryption-customer-algorithm` header.
    #
    # If you encrypt an object by using server-side encryption with customer-provided encryption keys
    # (SSE-C) when you store the object in Amazon S3, then when you GET the object, you must use the
    # following headers:
    #
    # - `x-amz-server-side-encryption-customer-algorithm`
    #
    # - `x-amz-server-side-encryption-customer-key`
    #
    # - `x-amz-server-side-encryption-customer-key-MD5`
    #
    # For more information about SSE-C, see [Server-Side Encryption (Using Customer-Provided
    # Encryption
    # Keys)](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key : String | Nil

    # Specifies the 128-bit MD5 digest of the customer-provided encryption key according to RFC 1321.
    # Amazon S3 uses this header for a message integrity check to ensure that the encryption key was
    # transmitted without error.
    #
    # If you encrypt an object by using server-side encryption with customer-provided encryption keys
    # (SSE-C) when you store the object in Amazon S3, then when you GET the object, you must use the
    # following headers:
    #
    # - `x-amz-server-side-encryption-customer-algorithm`
    #
    # - `x-amz-server-side-encryption-customer-key`
    #
    # - `x-amz-server-side-encryption-customer-key-MD5`
    #
    # For more information about SSE-C, see [Server-Side Encryption (Using Customer-Provided
    # Encryption
    # Keys)](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html) in
    # the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_key_md5 : String | Nil

    property request_payer : RequestPayer | Nil

    # Part number of the object being read. This is a positive integer between 1 and 10,000.
    # Effectively performs a 'ranged' GET request for the part specified. Useful for downloading just
    # a part of an object.
    property part_number : Int32 | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # To retrieve the checksum, this mode must be enabled.
    property checksum_mode : ChecksumMode | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @if_match : String | Nil = nil,
      @if_modified_since : Time | Nil = nil,
      @if_none_match : String | Nil = nil,
      @if_unmodified_since : Time | Nil = nil,
      @range : String | Nil = nil,
      @response_cache_control : String | Nil = nil,
      @response_content_disposition : String | Nil = nil,
      @response_content_encoding : String | Nil = nil,
      @response_content_language : String | Nil = nil,
      @response_content_type : String | Nil = nil,
      @response_expires : Time | Nil = nil,
      @version_id : String | Nil = nil,
      @sse_customer_algorithm : String | Nil = nil,
      @sse_customer_key : String | Nil = nil,
      @sse_customer_key_md5 : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @part_number : Int32 | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @checksum_mode : ChecksumMode | Nil = nil,
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

    def_equals_and_hash(@bucket, @if_match, @if_modified_since, @if_none_match, @if_unmodified_since, @key, @range, @response_cache_control, @response_content_disposition, @response_content_encoding, @response_content_language, @response_content_type, @response_expires, @version_id, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5, @request_payer, @part_number, @expected_bucket_owner, @checksum_mode)
  end
end
