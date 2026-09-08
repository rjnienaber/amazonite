private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # A Retention configuration for an object.
  class ObjectLockRetention
    # Indicates the Retention mode for the specified object.
    property mode : ObjectLockRetentionMode | Nil

    # The date on which this Object Lock Retention will expire.
    property retain_until_date : Time | Nil

    def initialize(
      @mode : ObjectLockRetentionMode | Nil = nil,
      @retain_until_date : Time | Nil = nil,
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
      if value = @mode
        xml.element("Mode") { xml.text value.to_json_object_key }
      end

      if value = @retain_until_date
        xml.element("RetainUntilDate") { xml.text Core::QueryValue.time(value) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        mode: (n = node.xpath_node("*[local-name()='Mode']")) ? AS::ObjectLockRetentionMode.from_json_object_key?(n.content) : nil,
        retain_until_date: Core::XMLValue.time(node.xpath_node("*[local-name()='RetainUntilDate']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@mode, @retain_until_date)
  end
end
