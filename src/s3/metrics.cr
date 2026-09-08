private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # A container specifying replication metrics-related settings enabling replication metrics and
  # events.
  class Metrics
    # Specifies whether the replication metrics are enabled.
    property status : MetricsStatus

    # A container specifying the time threshold for emitting the
    # `s3:Replication:OperationMissedThreshold` event.
    property event_threshold : ReplicationTimeValue | Nil

    def initialize(
      @status : MetricsStatus,
      @event_threshold : ReplicationTimeValue | Nil = nil,
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

      if value = @event_threshold
        xml.element("EventThreshold") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        status: ((n = node.xpath_node("*[local-name()='Status']")) ? AS::MetricsStatus.from_json_object_key?(n.content) : nil).not_nil!,
        event_threshold: node.xpath_node("*[local-name()='EventThreshold']").try { |n| ReplicationTimeValue.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @event_threshold
        value.validate!
      end
    end

    def_equals_and_hash(@status, @event_threshold)
  end
end
