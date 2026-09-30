private alias AS = Amazonite::S3
private alias Core = Amazonite::Core

module Amazonite::S3
  # A Retention configuration for an object.
  class ObjectLockRetention
    # Indicates the Retention mode for the specified object.
    property mode : ObjectLockRetentionMode | Nil

    # The date on which this Object Lock Retention will expire.
    property retain_until_date : Time | Nil

    # The event hold status for the object. Set to `ON` to enable an event hold or `OFF` to disable
    # it.
    property event_hold : ObjectLockEventHold | Nil

    # The event hold duration for the object. Specifies how long the object remains protected after
    # the event hold is released.
    property event_hold_duration : EventHoldDuration | Nil

    def initialize(
      @mode : ObjectLockRetentionMode | Nil = nil,
      @retain_until_date : Time | Nil = nil,
      @event_hold : ObjectLockEventHold | Nil = nil,
      @event_hold_duration : EventHoldDuration | Nil = nil,
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

      if value = @event_hold
        xml.element("EventHold") { xml.text value.to_json_object_key }
      end

      if value = @event_hold_duration
        xml.element("EventHoldDuration") { value.build_xml(xml) }
      end
    end

    def self.from_xml(node : XML::Node) : self
      new(
        mode: (n = node.xpath_node("*[local-name()='Mode']")) ? AS::ObjectLockRetentionMode.from_json_object_key?(n.content) : nil,
        retain_until_date: Core::XMLValue.time(node.xpath_node("*[local-name()='RetainUntilDate']")),
        event_hold: (n = node.xpath_node("*[local-name()='EventHold']")) ? AS::ObjectLockEventHold.from_json_object_key?(n.content) : nil,
        event_hold_duration: node.xpath_node("*[local-name()='EventHoldDuration']").try { |n| EventHoldDuration.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @event_hold_duration
        value.validate!
      end
    end

    def_equals_and_hash(@mode, @retain_until_date, @event_hold, @event_hold_duration)
  end
end
