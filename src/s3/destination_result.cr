private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The destination information for the S3 Metadata configuration.
  class DestinationResult
    # The type of the table bucket where the metadata configuration is stored. The `aws` value
    # indicates an Amazon Web Services managed table bucket, and the `customer` value indicates a
    # customer-managed table bucket. V2 metadata configurations are stored in Amazon Web Services
    # managed table buckets, and V1 metadata configurations are stored in customer-managed table
    # buckets.
    property table_bucket_type : S3TablesBucketType | Nil

    # The Amazon Resource Name (ARN) of the table bucket where the metadata configuration is stored.
    property table_bucket_arn : String | Nil

    # The namespace in the table bucket where the metadata tables for a metadata configuration are
    # stored.
    property table_namespace : String | Nil

    def initialize(
      @table_bucket_type : S3TablesBucketType | Nil = nil,
      @table_bucket_arn : String | Nil = nil,
      @table_namespace : String | Nil = nil,
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
      if value = @table_bucket_type
        xml.element("TableBucketType") { xml.text value.to_json_object_key }
      end

      if value = @table_bucket_arn
        xml.element("TableBucketArn") { xml.text value }
      end

      if value = @table_namespace
        xml.element("TableNamespace") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        table_bucket_type: (n = node.xpath_node("*[local-name()='TableBucketType']")) ? AS::S3TablesBucketType.from_json_object_key?(n.content) : nil,
        table_bucket_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='TableBucketArn']")),
        table_namespace: Core::XMLValue.string(node.xpath_node("*[local-name()='TableNamespace']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@table_bucket_type, @table_bucket_arn, @table_namespace)
  end
end
