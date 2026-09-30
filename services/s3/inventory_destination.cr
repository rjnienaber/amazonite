private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies the S3 Inventory configuration for an Amazon S3 bucket.
  class InventoryDestination
    # Contains the bucket name, file format, bucket owner (optional), and prefix (optional) where
    # inventory results are published.
    property s3_bucket_destination : InventoryS3BucketDestination

    def initialize(
      @s3_bucket_destination : InventoryS3BucketDestination,
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
        s3_bucket_destination: node.xpath_node("*[local-name()='S3BucketDestination']").try { |n| InventoryS3BucketDestination.from_xml(n) }.not_nil!,
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
