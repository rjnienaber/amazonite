private alias Core = Amazonite::Core

module Amazonite::S3
  # A filter that identifies the subset of objects to which the replication rule applies. A `Filter`
  # must specify exactly one `Prefix`, `Tag`, or an `And` child element.
  class ReplicationRuleFilter
    # An object key name prefix that identifies the subset of objects to which the rule applies.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property prefix : String | Nil

    # A container for specifying a tag key and value.
    #
    # The rule applies only to objects that have the tag in their tag set.
    property tag : Tag | Nil

    # A container for specifying rule filters. The filters determine the subset of objects to which
    # the rule applies. This element is required only if you specify more than one filter. For
    # example:
    #
    # - If you specify both a `Prefix` and a `Tag` filter, wrap these filters in an `And` tag.
    #
    # - If you specify a filter based on multiple tags, wrap the `Tag` elements in an `And` tag.
    property and : ReplicationRuleAndOperator | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @tag : Tag | Nil = nil,
      @and : ReplicationRuleAndOperator | Nil = nil,
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
        and: node.xpath_node("*[local-name()='And']").try { |n| ReplicationRuleAndOperator.from_xml(n) },
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
