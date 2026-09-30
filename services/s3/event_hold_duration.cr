private alias Core = Amazonite::Core

module Amazonite::S3
  # Contains the event hold duration configuration, specified in either days or years.
  class EventHoldDuration
    # The number of days for the event hold duration. The minimum value is 1 and the maximum value is
    # 36,500.
    property days : Int32 | Nil

    # The number of years for the event hold duration. The minimum value is 1 and the maximum value is
    # 100.
    property years : Int32 | Nil

    def initialize(
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
      if value = @days
        xml.element("Days") { xml.text value.to_s }
      end

      if value = @years
        xml.element("Years") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        days: Core::XMLValue.i32(node.xpath_node("*[local-name()='Days']")),
        years: Core::XMLValue.i32(node.xpath_node("*[local-name()='Years']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@days, @years)
  end
end
