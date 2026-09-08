private alias Core = Amazonite::Core

module Amazonite::S3
  # A conjunction (logical AND) of predicates, which is used in evaluating a metrics filter. The
  # operator must have at least two predicates in any combination, and an object must match all of
  # the predicates for the filter to apply.
  class AnalyticsAndOperator
    # The prefix to use when evaluating an AND predicate: The prefix that an object must have to be
    # included in the metrics results.
    property prefix : String | Nil

    # The list of tags to use when evaluating an AND predicate.
    property tags : Array(Tag) | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
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
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        tags: node.xpath_nodes("*[local-name()='Tag']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@prefix, @tags)
  end
end
