private alias Core = Amazonite::Core

module Amazonite::S3
  # A container for specifying a filter that excludes matching objects from the replication rule.
  # Specify exactly one `Prefix`, `Tag`, or `Or` child element.
  class ReplicationRuleNotOperator
    # An object key name prefix that identifies objects to exclude from the replication rule.
    property prefix : String | Nil

    # A tag key and value that identify objects to exclude from the replication rule.
    property tag : Tag | Nil

    # A container for specifying prefixes and tags. An object is excluded from the replication rule if
    # it matches any of the specified filters.
    property or : ReplicationRuleOrOperator | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @tag : Tag | Nil = nil,
      @or : ReplicationRuleOrOperator | Nil = nil,
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

      if value = @or
        xml.element("Or") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        tag: node.xpath_node("*[local-name()='Tag']").try { |n| Tag.from_xml(n) },
        or: node.xpath_node("*[local-name()='Or']").try { |n| ReplicationRuleOrOperator.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tag
        value.validate!
      end

      if value = @or
        value.validate!
      end
    end

    def_equals_and_hash(@prefix, @tag, @or)
  end
end
