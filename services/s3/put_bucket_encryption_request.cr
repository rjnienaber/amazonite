private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class PutBucketEncryptionRequest
    # Specifies default encryption for a bucket using server-side encryption with different key
    # options.
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

    # The Base64 encoded 128-bit `MD5` digest of the server-side encryption configuration.
    #
    # For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
    # Services SDKs, this field is calculated automatically.
    #
    # This functionality is not supported for directory buckets.
    property content_md5 : String | Nil

    # Indicates the algorithm used to create the checksum for the request when you use the SDK. This
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
    # For directory buckets, when you use Amazon Web Services SDKs, `CRC32` is the default checksum
    # algorithm that's used for performance.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    property server_side_encryption_configuration : ServerSideEncryptionConfiguration

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    #
    # For directory buckets, this header is not supported in this API operation. If you specify this
    # header, the request fails with the HTTP status code `501 Not Implemented`.
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @server_side_encryption_configuration : ServerSideEncryptionConfiguration,
      @content_md5 : String | Nil = nil,
      @checksum_algorithm : ChecksumAlgorithm | Nil = nil,
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
      if value = @server_side_encryption_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @content_md5, @checksum_algorithm, @server_side_encryption_configuration, @expected_bucket_owner)
  end
end
