private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # Contains information about where to publish the analytics results.
  class AnalyticsS3BucketDestination
    # Specifies the file format used when exporting data to Amazon S3.
    property format : AnalyticsS3ExportFileFormat

    # The account ID that owns the destination S3 bucket. If no account ID is provided, the owner is
    # not validated before exporting data.
    #
    # Although this value is optional, we strongly recommend that you set it to help prevent problems
    # if the destination bucket ownership changes.
    property bucket_account_id : String | Nil

    # The Amazon Resource Name (ARN) of the bucket to which data is exported.
    property bucket : String

    # The prefix to use when exporting data. The prefix is prepended to all results.
    property prefix : String | Nil

    def initialize(
      @format : AnalyticsS3ExportFileFormat,
      @bucket : String,
      @bucket_account_id : String | Nil = nil,
      @prefix : String | Nil = nil,
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
      xml.element("Format") { xml.text @format.to_json_object_key }

      if value = @bucket_account_id
        xml.element("BucketAccountId") { xml.text value }
      end

      xml.element("Bucket") { xml.text @bucket }

      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        format: ((n = node.xpath_node("*[local-name()='Format']")) ? AS::AnalyticsS3ExportFileFormat.from_json_object_key?(n.content) : nil).not_nil!,
        bucket_account_id: Core::XMLValue.string(node.xpath_node("*[local-name()='BucketAccountId']")),
        bucket: Core::XMLValue.string(node.xpath_node("*[local-name()='Bucket']")).not_nil!,
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@format, @bucket_account_id, @bucket, @prefix)
  end
end
