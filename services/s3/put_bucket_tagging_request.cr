private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class PutBucketTaggingRequest
    # The bucket name.
    property bucket : String = ""

    # The Base64 encoded 128-bit `MD5` digest of the data. You must use this header as a message
    # integrity check to verify that the request body was not corrupted in transit. For more
    # information, see [RFC 1864](http://www.ietf.org/rfc/rfc1864.txt).
    #
    # For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
    # Services SDKs, this field is calculated automatically.
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
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # Container for the `TagSet` and `Tag` elements.
    property tagging : Tagging

    # The account ID of the expected bucket owner. If the account ID that you provide does not match
    # the actual owner of the bucket, the request fails with the HTTP status code `403 Forbidden`
    # (access denied).
    property expected_bucket_owner : String | Nil

    def initialize(
      @bucket : String,
      @tagging : Tagging,
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
      if value = @tagging
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @content_md5, @checksum_algorithm, @tagging, @expected_bucket_owner)
  end
end
