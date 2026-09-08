private alias AS = Amazonite::S3

module Amazonite::S3
  class PutBucketPolicyRequest
    # The name of the bucket.
    #
    # **Directory buckets ** - When you use this operation with a directory bucket, you must use
    # path-style requests in the format
    # `https://s3express-control.*region-code*.amazonaws.com/*bucket-name* `. Virtual-hosted-style
    # requests aren't supported. Directory bucket names must be unique in the chosen Zone
    # (Availability Zone or Local Zone). Bucket names must also follow the format `
    # *bucket-base-name*--*zone-id*--x-s3` (for example, ` *DOC-EXAMPLE-BUCKET*--*usw2-az1*--x-s3`).
    # For information about bucket naming restrictions, see [Directory bucket naming
    # rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-bucket-naming-rules.html)
    # in the *Amazon S3 User Guide*
    property bucket : String = ""

    # The MD5 hash of the request body.
    #
    # For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
    # Services SDKs, this field is calculated automatically.
    #
    # This functionality is not supported for directory buckets.
    property content_md5 : String | Nil

    # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
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
    # For directory buckets, when you use Amazon Web Services SDKs, `CRC32` is the default checksum
    # algorithm that's used for performance.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # Set this parameter to true to confirm that you want to remove your permissions to change this
    # bucket policy in the future.
    #
    # This functionality is not supported for directory buckets.
    property confirm_remove_self_bucket_access : Bool | Nil

    # The bucket policy as a JSON document.
    #
    # For directory buckets, the only IAM action supported in the bucket policy is
    # `s3express:CreateSession`.
    property policy : String

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    #
    # For directory buckets, this header is not supported in this API operation. If you specify this
    # header, the request fails with the HTTP status code `501 Not Implemented`.
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @policy : String,
      @content_md5 : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
      @confirm_remove_self_bucket_access : Bool | Nil = nil,
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
    end

    def_equals_and_hash(@bucket, @content_md5, @checksum_algorithm, @confirm_remove_self_bucket_access, @policy, @expected_bucket_owner)
  end
end
