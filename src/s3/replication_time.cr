private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # A container specifying S3 Replication Time Control (S3 RTC) related information, including
  # whether S3 RTC is enabled and the time when all objects and operations on objects must be
  # replicated. Must be specified together with a `Metrics` block.
  class ReplicationTime
    # Specifies whether the replication time is enabled.
    property status : ReplicationTimeStatus

    # A container specifying the time by which replication should be complete for all objects and
    # operations on objects.
    property time : ReplicationTimeValue

    def initialize(
      @status : ReplicationTimeStatus,
      @time : ReplicationTimeValue,
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
      xml.element("Status") { xml.text @status.to_json_object_key }

      xml.element("Time") { @time.build_xml(xml) }
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::ReplicationTimeStatus.from_json_object_key?(n.content) : nil).not_nil!,
        time: node.xpath_node("*[local-name()='Time']").try { |n| ReplicationTimeValue.from_xml(n) }.not_nil!,
      )
    end

    def validate! : Nil
      if value = @time
        value.validate!
      end
    end

    def_equals_and_hash(@status, @time)
  end
end
