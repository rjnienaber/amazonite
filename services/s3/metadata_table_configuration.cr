private alias Core = Amazonite::Core

module Amazonite::S3
  # The V1 S3 Metadata configuration for a general purpose bucket.
  #
  # If you created your S3 Metadata configuration before July 15, 2025, we recommend that you delete
  # and re-create your configuration by using
  # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
  # so that you can expire journal table records and create a live inventory table.
  class MetadataTableConfiguration
    # The destination information for the metadata table configuration. The destination table bucket
    # must be in the same Region and Amazon Web Services account as the general purpose bucket. The
    # specified metadata table name must be unique within the `aws_s3_metadata` namespace in the
    # destination table bucket.
    property s3_tables_destination : S3TablesDestination

    def initialize(
      @s3_tables_destination : S3TablesDestination,
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
      xml.element("S3TablesDestination") { @s3_tables_destination.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        s3_tables_destination: node.xpath_node("*[local-name()='S3TablesDestination']").try { |n| S3TablesDestination.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @s3_tables_destination
        value.validate!
      end
    end

    def_equals_and_hash(@s3_tables_destination)
  end
end
