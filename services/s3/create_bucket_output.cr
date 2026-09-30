private alias Core = Amazonite::Core

module Amazonite::S3
  class CreateBucketOutput
    # A forward slash followed by the name of the bucket for all account regional namespace buckets
    # and all global general purpose buckets created in us-east-1. For example,
    # `/amzn-s3-demo-bucket`. For global general purpose buckets created in other Amazon Web Services
    # Regions, the Location field is the global endpoint URL. For example,
    # `http://amzn-s3-demo-bucket.s3.amazonaws.com/`.
    property location : String | Nil

    # The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web Services
    # resources across all of Amazon Web Services.
    #
    # This parameter is only supported for S3 directory buckets. For more information, see [Using tags
    # with directory
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-tagging.html).
    property bucket_arn : String | Nil

    def initialize(
      @location : String | Nil = nil,
      @bucket_arn : String | Nil = nil,
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
      if value = @bucket_arn
        raise Core::ValidationError.new("BucketArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("BucketArn length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BucketArn does not match the required pattern") unless value.matches?(Regex.new("^arn:[^:]+:(s3|s3express):"))
      end
    end

    def_equals_and_hash(@location, @bucket_arn)
  end
end
