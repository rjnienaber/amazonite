module Amazonite::S3
  class GetBucketEncryptionRequest
    # The name of the bucket from which the server-side encryption configuration is retrieved.
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

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    #
    # For directory buckets, this header is not supported in this API operation. If you specify this
    # header, the request fails with the HTTP status code `501 Not Implemented`.
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
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

    def_equals_and_hash(@bucket, @expected_bucket_owner)
  end
end
