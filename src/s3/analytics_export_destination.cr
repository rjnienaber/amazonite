private alias Core = Amazonite::Core

module Amazonite::S3
  # Where to publish the analytics results.
  class AnalyticsExportDestination
    # A destination signifying output to an S3 bucket.
    property s3_bucket_destination : AnalyticsS3BucketDestination

    def initialize(
      @s3_bucket_destination : AnalyticsS3BucketDestination,
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
      xml.element("S3BucketDestination") { @s3_bucket_destination.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3_bucket_destination: node.xpath_node("*[local-name()='S3BucketDestination']").try { |n| AnalyticsS3BucketDestination.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @s3_bucket_destination
        value.validate!
      end
    end

    def_equals_and_hash(@s3_bucket_destination)
  end
end
