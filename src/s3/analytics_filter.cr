private alias Core = Amazonite::Core

module Amazonite::S3
  # The filter used to describe a set of objects for analyses. A filter must have exactly one
  # prefix, one tag, or one conjunction (AnalyticsAndOperator). If no filter is provided, all
  # objects will be considered in any analysis.
  class AnalyticsFilter
    # The prefix to use when evaluating an analytics filter.
    property prefix : String | Nil

    # The tag to use when evaluating an analytics filter.
    property tag : Tag | Nil

    # A conjunction (logical AND) of predicates, which is used in evaluating an analytics filter. The
    # operator must have at least two predicates.
    property and : AnalyticsAndOperator | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @tag : Tag | Nil = nil,
      @and : AnalyticsAndOperator | Nil = nil,
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

      if value = @and
        xml.element("And") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        tag: node.xpath_node("*[local-name()='Tag']").try { |n| Tag.from_xml(n) },
        and: node.xpath_node("*[local-name()='And']").try { |n| AnalyticsAndOperator.from_xml(n) },
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

    def_equals_and_hash(@prefix, @tag, @and)
  end
end
