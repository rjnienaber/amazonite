private alias Core = Amazonite::Core

module Amazonite::S3
  # This is used in a Lifecycle Rule Filter to apply a logical AND to two or more predicates. The
  # Lifecycle Rule will apply to any object matching all of the predicates configured inside the And
  # operator.
  class LifecycleRuleAndOperator
    # Prefix identifying one or more objects to which the rule applies.
    property prefix : String | Nil

    # All of these tags must exist in the object's tag set in order for the rule to apply.
    property tags : Array(Tag) | Nil

    # Minimum object size to which the rule applies.
    property object_size_greater_than : Int64 | Nil

    # Maximum object size to which the rule applies.
    property object_size_less_than : Int64 | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @object_size_greater_than : Int64 | Nil = nil,
      @object_size_less_than : Int64 | Nil = nil,
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

      if value = @object_size_greater_than
        xml.element("ObjectSizeGreaterThan") { xml.text value.to_s }
      end

      if value = @object_size_less_than
        xml.element("ObjectSizeLessThan") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        tags: node.xpath_nodes("*[local-name()='Tag']").map { |n| Tag.from_xml(n) },
        object_size_greater_than: Core::XMLValue.i64(node.xpath_node("*[local-name()='ObjectSizeGreaterThan']")),
        object_size_less_than: Core::XMLValue.i64(node.xpath_node("*[local-name()='ObjectSizeLessThan']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@prefix, @tags, @object_size_greater_than, @object_size_less_than)
  end
end
