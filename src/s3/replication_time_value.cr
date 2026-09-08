private alias Core = Amazonite::Core

module Amazonite::S3
  # A container specifying the time value for S3 Replication Time Control (S3 RTC) and replication
  # metrics `EventThreshold`.
  class ReplicationTimeValue
    # Contains an integer specifying time in minutes.
    #
    # Valid value: 15
    property minutes : Int32 | Nil

    def initialize(
      @minutes : Int32 | Nil = nil,
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
      if value = @minutes
        xml.element("Minutes") { xml.text value.to_s }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        minutes: Core::XMLValue.i32(node.xpath_node("*[local-name()='Minutes']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@minutes)
  end
end
