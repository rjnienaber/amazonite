private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # The container element for optionally specifying the default Object Lock retention settings for
  # new objects placed in the specified bucket.
  #
  # - The `DefaultRetention` settings require both a mode and a period.
  #
  # - The `DefaultRetention` period can be either `Days` or `Years` but you must select one. You
  # cannot specify `Days` and `Years` at the same time.
  class DefaultRetention
    # The default Object Lock retention mode you want to apply to new objects placed in the specified
    # bucket. Must be used with either `Days` or `Years`.
    property mode : ObjectLockRetentionMode | Nil

    # The number of days that you want to specify for the default retention period. Must be used with
    # `Mode`.
    property days : Int32 | Nil

    # The number of years that you want to specify for the default retention period. Must be used with
    # `Mode`.
    property years : Int32 | Nil

    def initialize(
      @mode : ObjectLockRetentionMode | Nil = nil,
      @days : Int32 | Nil = nil,
      @years : Int32 | Nil = nil,
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

      if value = @days
        xml.element("Days") { xml.text value.to_s }
      end

      if value = @years
        xml.element("Years") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        mode: (n = node.xpath_node("*[local-name()='Mode']")) ? AS::ObjectLockRetentionMode.from_json_object_key?(n.content) : nil,
        days: Core::XMLValue.i32(node.xpath_node("*[local-name()='Days']")),
        years: Core::XMLValue.i32(node.xpath_node("*[local-name()='Years']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@mode, @days, @years)
  end
end
