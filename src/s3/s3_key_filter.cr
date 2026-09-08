private alias Core = Amazonite::Core

module Amazonite::S3
  # A container for object key name prefix and suffix filtering rules.
  class S3KeyFilter
    property filter_rules : Array(FilterRule) | Nil

    def initialize(
      @filter_rules : Array(FilterRule) | Nil = nil,
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
      (@filter_rules || [] of FilterRule).each do |item|
        xml.element("FilterRule") { item.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        filter_rules: node.xpath_nodes("*[local-name()='FilterRule']").map { |n| FilterRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @filter_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@filter_rules)
  end
end
