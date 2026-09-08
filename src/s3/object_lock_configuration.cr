private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The container element for Object Lock configuration parameters.
  class ObjectLockConfiguration
    # Indicates whether this bucket has an Object Lock configuration enabled. Enable
    # `ObjectLockEnabled` when you apply `ObjectLockConfiguration` to a bucket.
    property object_lock_enabled : ObjectLockEnabled | Nil

    # Specifies the Object Lock rule for the specified object. Enable the this rule when you apply
    # `ObjectLockConfiguration` to a bucket. Bucket settings require both a mode and a period. The
    # period can be either `Days` or `Years` but you must select one. You cannot specify `Days` and
    # `Years` at the same time.
    property rule : ObjectLockRule | Nil

    def initialize(
      @object_lock_enabled : ObjectLockEnabled | Nil = nil,
      @rule : ObjectLockRule | Nil = nil,
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
      if value = @object_lock_enabled
        xml.element("ObjectLockEnabled") { xml.text value.to_json_object_key }
      end

      if value = @rule
        xml.element("Rule") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        object_lock_enabled: (n = node.xpath_node("*[local-name()='ObjectLockEnabled']")) ? AS::ObjectLockEnabled.from_json_object_key?(n.content) : nil,
        rule: node.xpath_node("*[local-name()='Rule']").try { |n| ObjectLockRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @rule
        value.validate!
      end
    end

    def_equals_and_hash(@object_lock_enabled, @rule)
  end
end
