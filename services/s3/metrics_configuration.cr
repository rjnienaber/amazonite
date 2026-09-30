private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies a metrics configuration for the CloudWatch request metrics (specified by the metrics
  # configuration ID) from an Amazon S3 bucket. If you're updating an existing metrics
  # configuration, note that this is a full replacement of the existing metrics configuration. If
  # you don't include the elements you want to keep, they are erased. For more information, see
  # [PutBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUTMetricConfiguration.html).
  class MetricsConfiguration
    # The ID used to identify the metrics configuration. The ID has a 64 character limit and can only
    # contain letters, numbers, periods, dashes, and underscores.
    property id : String

    # Specifies a metrics configuration filter. The metrics configuration will only include objects
    # that meet the filter's criteria. A filter must be a prefix, an object tag, an access point ARN,
    # or a conjunction (MetricsAndOperator).
    #
    # Metrics configurations for directory buckets do not support tag filters.
    property filter : MetricsFilter | Nil

    def initialize(
      @id : String,
      @filter : MetricsFilter | Nil = nil,
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
      xml.element("Id") { xml.text @id }

      if value = @filter
        xml.element("Filter") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='Id']")).not_nil!,
        filter: node.xpath_node("*[local-name()='Filter']").try { |n| MetricsFilter.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filter
        value.validate!
      end
    end

    def_equals_and_hash(@id, @filter)
  end
end
