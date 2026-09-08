private alias AS = Amazonite::S3

module Amazonite::S3
  # Specifies the schedule for generating S3 Inventory results.
  class InventorySchedule
    # Specifies how frequently inventory results are produced.
    property frequency : InventoryFrequency

    def initialize(
      @frequency : InventoryFrequency,
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
      xml.element("Frequency") { xml.text @frequency.to_json_object_key }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        frequency: ((n = node.xpath_node("*[local-name()='Frequency']")) ? AS::InventoryFrequency.from_json_object_key?(n.content) : nil).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@frequency)
  end
end
