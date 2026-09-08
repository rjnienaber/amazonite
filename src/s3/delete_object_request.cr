private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class DeleteObjectRequest
    # The bucket name of the bucket containing the object.
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

    # Key name of the object to delete.
    property key : String = ""

    # The concatenation of the authentication device's serial number, a space, and the value that is
    # displayed on your authentication device. Required to permanently delete a versioned object if
    # versioning is configured with MFA delete enabled.
    #
    # This functionality is not supported for directory buckets.
    property mfa : String | Nil

    # Version ID used to reference a specific version of the object.
    #
    # For directory buckets in this API operation, only the `null` value of the version ID is
    # supported.
    property version_id : String | Nil

    property request_payer : RequestPayer | Nil

    # Indicates whether S3 Object Lock should bypass Governance-mode restrictions to process this
    # operation. To use this header, you must have the `s3:BypassGovernanceRetention` permission.
    #
    # This functionality is not supported for directory buckets.
    property bypass_governance_retention : Bool | Nil

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    # Deletes the object if the ETag (entity tag) value provided during the delete operation matches
    # the ETag of the object in S3. If the ETag values do not match, the operation returns a `412
    # Precondition Failed` error.
    #
    # Expects the ETag value as a string. `If-Match` does accept a string value of an '*' (asterisk)
    # character to denote a match of any ETag.
    #
    # For more information about conditional requests, see [RFC
    # 7232](https://tools.ietf.org/html/rfc7232).
    property if_match : String | Nil

    # If present, the object is deleted only if its modification times matches the provided
    # `Timestamp`. If the `Timestamp` values do not match, the operation returns a `412 Precondition
    # Failed` error. If the `Timestamp` matches or if the object doesn’t exist, the operation returns
    # a `204 Success (No Content)` response.
    #
    # This functionality is only supported for directory buckets.
    property if_match_last_modified_time : Time | Nil

    # If present, the object is deleted only if its size matches the provided size in bytes. If the
    # `Size` value does not match, the operation returns a `412 Precondition Failed` error. If the
    # `Size` matches or if the object doesn’t exist, the operation returns a `204 Success (No
    # Content)` response.
    #
    # This functionality is only supported for directory buckets.
    #
    # You can use the `If-Match`, `x-amz-if-match-last-modified-time` and `x-amz-if-match-size`
    # conditional headers in conjunction with each-other or individually.
    property if_match_size : Int64 | Nil

    def initialize(
      @bucket : String,
      @key : String,
      @mfa : String | Nil = nil,
      @version_id : String | Nil = nil,
      @request_payer : RequestPayer | Nil = nil,
      @bypass_governance_retention : Bool | Nil = nil,
      @expected_bucket_owner : String | Nil = nil,
      @if_match : String | Nil = nil,
      @if_match_last_modified_time : Time | Nil = nil,
      @if_match_size : Int64 | Nil = nil,
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

    def_equals_and_hash(@bucket, @key, @mfa, @version_id, @request_payer, @bypass_governance_retention, @expected_bucket_owner, @if_match, @if_match_last_modified_time, @if_match_size)
  end
end
