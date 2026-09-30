private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  class PutBucketAbacRequest
    # The name of the general purpose bucket.
    property bucket : String = ""

    # The MD5 hash of the `PutBucketAbac` request body.
    #
    # For requests made using the Amazon Web Services Command Line Interface (CLI) or Amazon Web
    # Services SDKs, this field is calculated automatically.
    property content_md5 : String | Nil

    # Indicates the algorithm that you want Amazon S3 to use to create the checksum. For more
    # information, see [ Checking object
    # integrity](https://docs.aws.amazon.com/AmazonS3/latest/userguide/checking-object-integrity.html)
    # in the *Amazon S3 User Guide*.
    property checksum_algorithm : ChecksumAlgorithm | Nil

    # The Amazon Web Services account ID of the general purpose bucket's owner.
    property expected_bucket_owner : String | Nil

    # The ABAC status of the general purpose bucket. When ABAC is enabled for the general purpose
    # bucket, you can use tags to manage access to the general purpose buckets as well as for cost
    # tracking purposes. When ABAC is disabled for the general purpose buckets, you can only use tags
    # for cost tracking purposes. For more information, see [Using tags with S3 general purpose
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/buckets-tagging.html).
    property abac_status : AbacStatus

    def initialize(
      @bucket : String,
      @abac_status : AbacStatus,
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
      if value = @abac_status
        value.validate!
      end
    end

    def_equals_and_hash(@bucket, @content_md5, @checksum_algorithm, @expected_bucket_owner, @abac_status)
  end
end
