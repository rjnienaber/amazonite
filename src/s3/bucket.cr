private alias Core = Amazonite::Core

module Amazonite::S3
  # In terms of implementation, a Bucket is a resource.
  class Bucket
    # The name of the bucket.
    property name : String | Nil

    # Date the bucket was created. This date can change when making changes to your bucket, such as
    # editing its bucket policy.
    property creation_date : Time | Nil

    # `BucketRegion` indicates the Amazon Web Services region where the bucket is located. If the
    # request contains at least one valid parameter, it is included in the response.
    property bucket_region : String | Nil

    # The Amazon Resource Name (ARN) of the S3 bucket. ARNs uniquely identify Amazon Web Services
    # resources across all of Amazon Web Services.
    #
    # This parameter is only supported for S3 directory buckets. For more information, see [Using tags
    # with directory
    # buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/directory-buckets-tagging.html).
    property bucket_arn : String | Nil

    def initialize(
      @name : String | Nil = nil,
      @creation_date : Time | Nil = nil,
      @bucket_region : String | Nil = nil,
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
      if value = @name
        xml.element("Name") { xml.text value }
      end

      if value = @creation_date
        xml.element("CreationDate") { xml.text Core::QueryValue.time(value) }
      end

      if value = @bucket_region
        xml.element("BucketRegion") { xml.text value }
      end

      if value = @bucket_arn
        xml.element("BucketArn") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        creation_date: Core::XMLValue.time(node.xpath_node("*[local-name()='CreationDate']")),
        bucket_region: Core::XMLValue.string(node.xpath_node("*[local-name()='BucketRegion']")),
        bucket_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='BucketArn']")),
      )
    end

    def validate! : Nil
      if value = @bucket_arn
        raise Core::ValidationError.new("BucketArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("BucketArn length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("BucketArn does not match the required pattern") unless value.matches?(Regex.new("^arn:[^:]+:(s3|s3express):"))
      end
    end

    def_equals_and_hash(@name, @creation_date, @bucket_region, @bucket_arn)
  end
end
