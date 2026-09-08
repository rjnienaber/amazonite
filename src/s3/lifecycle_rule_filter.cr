private alias Core = Amazonite::Core

module Amazonite::S3
  # The `Filter` is used to identify objects that a Lifecycle Rule applies to. A `Filter` can have
  # exactly one of `Prefix`, `Tag`, `ObjectSizeGreaterThan`, `ObjectSizeLessThan`, or `And`
  # specified. If the `Filter` element is left empty, the Lifecycle Rule applies to all objects in
  # the bucket.
  class LifecycleRuleFilter
    # Prefix identifying one or more objects to which the rule applies.
    #
    # Replacement must be made for object keys containing special characters (such as carriage
    # returns) when using XML requests. For more information, see [ XML related object key
    # constraints](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-keys.html#object-key-xml-related-constraints).
    property prefix : String | Nil

    # This tag must exist in the object's tag set in order for the rule to apply.
    #
    # This parameter applies to general purpose buckets only. It is not supported for directory bucket
    # lifecycle configurations.
    property tag : Tag | Nil

    # Minimum object size to which the rule applies.
    property object_size_greater_than : Int64 | Nil

    # Maximum object size to which the rule applies.
    property object_size_less_than : Int64 | Nil

    property and : LifecycleRuleAndOperator | Nil

    def initialize(
      @prefix : String | Nil = nil,
      @tag : Tag | Nil = nil,
      @object_size_greater_than : Int64 | Nil = nil,
      @object_size_less_than : Int64 | Nil = nil,
      @and : LifecycleRuleAndOperator | Nil = nil,
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

      if value = @object_size_greater_than
        xml.element("ObjectSizeGreaterThan") { xml.text value.to_s }
      end

      if value = @object_size_less_than
        xml.element("ObjectSizeLessThan") { xml.text value.to_s }
      end

      if value = @and
        xml.element("And") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='Prefix']")),
        tag: node.xpath_node("*[local-name()='Tag']").try { |n| Tag.from_xml(n) },
        object_size_greater_than: Core::XMLValue.i64(node.xpath_node("*[local-name()='ObjectSizeGreaterThan']")),
        object_size_less_than: Core::XMLValue.i64(node.xpath_node("*[local-name()='ObjectSizeLessThan']")),
        and: node.xpath_node("*[local-name()='And']").try { |n| LifecycleRuleAndOperator.from_xml(n) },
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

    def_equals_and_hash(@prefix, @tag, @object_size_greater_than, @object_size_less_than, @and)
  end
end
