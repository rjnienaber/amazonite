private alias Core = Amazonite::Core

module Amazonite::S3
  # The destination information for a V1 S3 Metadata configuration. The destination table bucket
  # must be in the same Region and Amazon Web Services account as the general purpose bucket. The
  # specified metadata table name must be unique within the `aws_s3_metadata` namespace in the
  # destination table bucket.
  #
  # If you created your S3 Metadata configuration before July 15, 2025, we recommend that you delete
  # and re-create your configuration by using
  # [CreateBucketMetadataConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucketMetadataConfiguration.html)
  # so that you can expire journal table records and create a live inventory table.
  class S3TablesDestinationResult
    # The Amazon Resource Name (ARN) for the table bucket that's specified as the destination in the
    # metadata table configuration. The destination table bucket must be in the same Region and Amazon
    # Web Services account as the general purpose bucket.
    property table_bucket_arn : String

    # The name for the metadata table in your metadata table configuration. The specified metadata
    # table name must be unique within the `aws_s3_metadata` namespace in the destination table
    # bucket.
    property table_name : String

    # The Amazon Resource Name (ARN) for the metadata table in the metadata table configuration. The
    # specified metadata table name must be unique within the `aws_s3_metadata` namespace in the
    # destination table bucket.
    property table_arn : String

    # The table bucket namespace for the metadata table in your metadata table configuration. This
    # value is always `aws_s3_metadata`.
    property table_namespace : String

    def initialize(
      @table_bucket_arn : String,
      @table_name : String,
      @table_arn : String,
      @table_namespace : String,
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
      xml.element("TableBucketArn") { xml.text @table_bucket_arn }

      xml.element("TableName") { xml.text @table_name }

      xml.element("TableArn") { xml.text @table_arn }

      xml.element("TableNamespace") { xml.text @table_namespace }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        table_bucket_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TableBucketArn']")).not_nil!,
        table_name: Core::XMLValue.string(node.xpath_node("*[local-name()='TableName']")).not_nil!,
        table_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TableArn']")).not_nil!,
        table_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='TableNamespace']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@table_bucket_arn, @table_name, @table_arn, @table_namespace)
  end
end
