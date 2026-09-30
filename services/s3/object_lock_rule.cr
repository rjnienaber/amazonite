private alias Core = Amazonite::Core

module Amazonite::S3
  # The container element for an Object Lock rule.
  class ObjectLockRule
    # The default Object Lock retention settings for new objects in this bucket. You can specify:
    #
    # - A default retention period, by using `Days` or `Years`.
    #
    # - A default event hold duration, by using `DefaultEventHold`. This setting also uses days or
    # years.
    #
    # You can set one or both. You cannot use days and years in the same setting.
    property default_retention : DefaultRetention | Nil

    def initialize(
      @default_retention : DefaultRetention | Nil = nil,
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
      if value = @default_retention
        xml.element("DefaultRetention") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        default_retention: node.xpath_node("*[local-name()='DefaultRetention']").try { |n| DefaultRetention.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @default_retention
        value.validate!
      end
    end

    def_equals_and_hash(@default_retention)
  end
end
