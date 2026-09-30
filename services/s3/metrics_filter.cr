private alias Core = Amazonite::Core

module Amazonite::S3
  # Specifies a metrics configuration filter. The metrics configuration only includes objects that
  # meet the filter's criteria. A filter must be a prefix, an object tag, an access point ARN, or a
  # conjunction (MetricsAndOperator). For more information, see
  # [PutBucketMetricsConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketMetricsConfiguration.html).
  class MetricsFilter
    # The prefix used when evaluating a metrics filter.
    property prefix : String | Nil

    # The tag used when evaluating a metrics filter.
    #
    # `Tag` filters are not supported for directory buckets.
    property tag : Tag | Nil

    # The access point ARN used when evaluating a metrics filter.
    property access_point_arn : String | Nil

    # A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The
    # operator must have at least two predicates, and an object must match all of the predicates in
    # order for the filter to apply.
    property and : MetricsAndOperator | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @tag : Tag | Nil = nil,
      @access_point_arn : String | Nil = nil,
      @and : MetricsAndOperator | Nil = nil,
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
      if value = @prefix
        xml.element("Prefix") { xml.text value }
      end

      if value = @tag
        xml.element("Tag") { value.build_xml(xml) }
      end

      if value = @access_point_arn
        xml.element("AccessPointArn") { xml.text value }
      end

      if value = @and
        xml.element("And") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        tag: node.xpath_node("*[local-name()='Tag']").try { |n| Tag.from_xml(n) },
        access_point_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessPointArn']")),
        and: node.xpath_node("*[local-name()='And']").try { |n| MetricsAndOperator.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag
        value.validate!
      end

      if value = @and
        value.validate!
      end
    end

    def_equals_and_hash(@prefix, @tag, @access_point_arn, @and)
  end
end
