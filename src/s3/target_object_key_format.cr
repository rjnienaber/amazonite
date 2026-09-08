private alias Core = Amazonite::Core

module Amazonite::S3
  # Amazon S3 key format for log objects. Only one format, PartitionedPrefix or SimplePrefix, is
  # allowed.
  class TargetObjectKeyFormat
    # To use the simple format for S3 keys for log objects. To specify SimplePrefix format, set
    # SimplePrefix to {}.
    property simple_prefix : SimplePrefix | Nil

    # Partitioned S3 key for log objects.
    property partitioned_prefix : PartitionedPrefix | Nil

    def initialize(
      @simple_prefix : SimplePrefix | Nil = nil,
      @partitioned_prefix : PartitionedPrefix | Nil = nil,
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
      if value = @simple_prefix
        xml.element("SimplePrefix") { value.build_xml(xml) }
      end

      if value = @partitioned_prefix
        xml.element("PartitionedPrefix") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        simple_prefix: node.xpath_node("*[local-name()='SimplePrefix']").try { |n| SimplePrefix.from_xml(n) },
        partitioned_prefix: node.xpath_node("*[local-name()='PartitionedPrefix']").try { |n| PartitionedPrefix.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @simple_prefix
        value.validate!
      end

      if value = @partitioned_prefix
        value.validate!
      end
    end

    def_equals_and_hash(@simple_prefix, @partitioned_prefix)
  end
end
