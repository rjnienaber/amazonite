private alias Core = Amazonite::Core

module Amazonite::S3
  # A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The
  # operator must have at least two predicates, and an object must match all of the predicates in
  # order for the filter to apply.
  class MetricsAndOperator
    # The prefix used when evaluating an AND predicate.
    property prefix : String | Nil

    # The list of tags used when evaluating an AND predicate.
    #
    # `Tag` filters are not supported for directory buckets.
    property tags : Array(Tag) | Nil

    # The access point ARN used when evaluating an `AND` predicate.
    property access_point_arn : String | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @access_point_arn : String | Nil = nil,
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

      (@tags || [] of Tag).each do |item|
        xml.element("Tag") { item.build_xml(xml) }
      end

      if value = @access_point_arn
        xml.element("AccessPointArn") { xml.text value }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        tags: node.xpath_nodes("*[local-name()='Tag']").map { |n| Tag.from_xml(n) },
        access_point_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='AccessPointArn']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@prefix, @tags, @access_point_arn)
  end
end
