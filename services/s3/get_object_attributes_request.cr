private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class GetObjectAttributesRequest
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

    # The object key.
    property key : String = ""

    # The version ID used to reference a specific version of the object.
    #
    # S3 Versioning isn't enabled and supported for directory buckets. For this API operation, only
    # the `null` value of the version ID is supported by directory buckets. You can only specify
    # `null` to the `versionId` query parameter in the request.
    property version_id : String | Nil

    # Sets the maximum number of parts to return. For more information, see [Uploading and copying
    # objects using multipart upload in Amazon S3
    # ](https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html) in the *Amazon Simple
    # Storage Service user guide*.
    property max_parts : Int32 | Nil

    # Specifies the part after which listing should begin. Only parts with higher part numbers will be
    # listed. For more information, see [Uploading and copying objects using multipart upload in
    # Amazon S3 ](https://docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html) in the
    # *Amazon Simple Storage Service user guide*.
    property part_number_marker : String | Nil

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

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # Specifies the fields at the root level that you want returned in the response. Fields that you
    # do not specify are not returned.
    property object_attributes : Array(ObjectAttributes) = [] of ObjectAttributes

    def initialize(
      @bucket : String,
      @key : String,
      @object_attributes : Array(ObjectAttributes),
      @version_id : String | Nil = nil,
      @max_parts : Int32 | Nil = nil,
      @part_number_marker : String | Nil = nil,
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

    def_equals_and_hash(@bucket, @key, @version_id, @max_parts, @part_number_marker, @sse_customer_algorithm, @sse_customer_key, @sse_customer_key_md5, @request_payer, @expected_bucket_owner, @object_attributes)
  end
end
