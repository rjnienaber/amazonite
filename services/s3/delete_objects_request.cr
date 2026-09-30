private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class DeleteObjectsRequest
    # The bucket name containing the objects to delete.
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

    # Container for the request.
    property delete : Delete

    # The concatenation of the authentication device's serial number, a space, and the value that is
    # displayed on your authentication device. Required to permanently delete a versioned object if
    # versioning is configured with MFA delete enabled.
    #
    # When performing the `DeleteObjects` operation on an MFA delete enabled bucket, which attempts to
    # delete the specified versioned objects, you must include an MFA token. If you don't provide an
    # MFA token, the entire request will fail, even if there are non-versioned objects that you are
    # trying to delete. If you provide an invalid token, whether there are versioned object keys in
    # the request or not, the entire Multi-Object Delete request will fail. For information about MFA
    # Delete, see [ MFA
    # Delete](https://docs.aws.amazon.com/AmazonS3/latest/dev/Versioning.html#MultiFactorAuthenticationDelete)
    # in the *Amazon S3 User Guide*.
    #
    # This functionality is not supported for directory buckets.
    property mfa : String | Nil

    property request_payer : RequestPayer | Nil

    # Specifies whether you want to delete this object even if it has a Governance-type Object Lock in
    # place. To use this header, you must have the `s3:BypassGovernanceRetention` permission.
    #
    # This functionality is not supported for directory buckets.
    property bypass_governance_retention : Bool | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # Indicates the algorithm used to create the checksum for the object when you use the SDK. This
    # header will not provide any additional functionality if you don't use the SDK. When you send
    # this header, there must be a corresponding `x-amz-checksum-*algorithm* ` or `x-amz-trailer`
    # header sent. Otherwise, Amazon S3 fails the request with the HTTP status code `400 Bad Request`.
    #
    # For the `x-amz-checksum-*algorithm* ` header, replace ` *algorithm* ` with the supported
    # algorithm from the following list:
    #
    # - `CRC32`
    #
    # - `CRC32C`
    #
    # - `CRC64NVME`
    #
    # - `MD5`
    #
    # - `SHA1`
    #
    # - `SHA256`
    #
    # - `SHA512`
    #
    # - `XXHASH3`
    #
    # - `XXHASH64`
    #
    # - `XXHASH128`
    #
    # For more information, see [Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    #
    # If the individual checksum value you provide through `x-amz-checksum-*algorithm* ` doesn't match
    # the checksum algorithm you set through `x-amz-sdk-checksum-algorithm`, Amazon S3 fails the
    # request with a `BadDigest` error.
    #
    # If you provide an individual checksum, Amazon S3 ignores any provided `ChecksumAlgorithm`
    # parameter.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    def initialize(
      @bucket : String,
      @delete : Delete,
      @mfa : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @bypass_governance_retention : Bool | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
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
      if value = @delete
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @delete, @mfa, @request_payer, @bypass_governance_retention, @expected_bucket_owner, @checksum_algorithm)
  end
end
