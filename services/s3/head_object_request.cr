private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class HeadObjectRequest
    # The name of the bucket that contains the object.
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

    # Return the object only if its entity tag (ETag) is the same as the one specified; otherwise,
    # return a 412 (precondition failed) error.
    #
    # If both of the `If-Match` and `If-Unmodified-Since` headers are present in the request as
    # follows:
    #
    # - `If-Match` condition evaluates to `true`, and;
    #
    # - `If-Unmodified-Since` condition evaluates to `false`;
    #
    # Then Amazon S3 returns `200 OK` and the data requested.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_match : String | Nil

    # Return the object only if it has been modified since the specified time; otherwise, return a 304
    # (not modified) error.
    #
    # If both of the `If-None-Match` and `If-Modified-Since` headers are present in the request as
    # follows:
    #
    # - `If-None-Match` condition evaluates to `false`, and;
    #
    # - `If-Modified-Since` condition evaluates to `true`;
    #
    # Then Amazon S3 returns the `304 Not Modified` response code.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_modified_since : Time | Nil

    # Return the object only if its entity tag (ETag) is different from the one specified; otherwise,
    # return a 304 (not modified) error.
    #
    # If both of the `If-None-Match` and `If-Modified-Since` headers are present in the request as
    # follows:
    #
    # - `If-None-Match` condition evaluates to `false`, and;
    #
    # - `If-Modified-Since` condition evaluates to `true`;
    #
    # Then Amazon S3 returns the `304 Not Modified` response code.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_none_match : String | Nil

    # Return the object only if it has not been modified since the specified time; otherwise, return a
    # 412 (precondition failed) error.
    #
    # If both of the `If-Match` and `If-Unmodified-Since` headers are present in the request as
    # follows:
    #
    # - `If-Match` condition evaluates to `true`, and;
    #
    # - `If-Unmodified-Since` condition evaluates to `false`;
    #
    # Then Amazon S3 returns `200 OK` and the data requested.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_unmodified_since : Time | Nil

    # The object key.
    property key : String = ""

    # HeadObject returns only the metadata for an object. If the Range is satisfiable, only the
    # `ContentLength` is affected in the response. If the Range is not satisfiable, S3 returns a `416
    # - Requested Range Not Satisfiable` error.
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
    # For directory buckets in this API operation, only the `null` value of the version ID is
    # supported.
    property version_id : String | Nil

    # Specifies the algorithm to use when encrypting the object (for example, AES256).
    #
    # This functionality is not supported for directory buckets.
    property sse_customer_algorithm : String | Nil

    # Specifies the customer-provided encryption key for Amazon S3 to use in encrypting data. This
    # value is used to store the object and then it is discarded; Amazon S3 does not store the
    # encryption key. The key must be appropriate for use with the algorithm specified in the
    # `x-amz-server-side-encryption-customer-algorithm` header.
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

    # Part number of the object being read. This is a positive integer between 1 and 10,000.
    # Effectively performs a 'ranged' HEAD request for the part specified. Useful querying about the
    # size of the part and the number of parts in this object.
    property part_number : Int32 | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # To retrieve the checksum, this parameter must be enabled.
    #
    # **General purpose buckets** - If you enable checksum mode and the object is uploaded with a
    # [checksum](https://docs.aws.amazon.com/AmazonS3/latest/API/API_Checksum.html) and encrypted with
    # an Key Management Service (KMS) key, you must have permission to use the `kms:Decrypt` action to
    # retrieve the checksum.
    #
    # **Directory buckets** - If you enable `ChecksumMode` and the object is encrypted with Amazon Web
    # Services Key Management Service (Amazon Web Services KMS), you must also have the
    # `kms:GenerateDataKey` and `kms:Decrypt` permissions in IAM identity-based policies and KMS key
    # policies for the KMS key to retrieve the checksum of the object.
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
