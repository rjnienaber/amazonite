private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a scheduled event for an instance.
  class InstanceStatusEvent
    # The ID of the event.
    property instance_event_id : String | Nil

    # The event code.
    property code : EventCode | Nil

    # A description of the event.
    #
    # After a scheduled event is completed, it can still be described for up to a week. If the event
    # has been completed, this description starts with the following text: [Completed].
    property description : String | Nil

    # The latest scheduled end time for the event.
    property not_after : Time | Nil

    # The earliest scheduled start time for the event.
    property not_before : Time | Nil

    # The deadline for starting the event.
    property not_before_deadline : Time | Nil

    def initialize(
      @instance_event_id : String | Nil = nil,
      @code : EventCode | Nil = nil,
      @description : String | Nil = nil,
      @not_after : Time | Nil = nil,
      @not_before : Time | Nil = nil,
      @not_before_deadline : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_event_id
        params << {"#{prefix}InstanceEventId", value}
      end

      if value = @code
        params << {"#{prefix}Code", value.to_json_object_key}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @not_after
        params << {"#{prefix}NotAfter", Core::QueryValue.time(value)}
      end

      if value = @not_before
        params << {"#{prefix}NotBefore", Core::QueryValue.time(value)}
      end

      if value = @not_before_deadline
        params << {"#{prefix}NotBeforeDeadline", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_event_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceEventId']")),
        code: (n = node.xpath_node("*[local-name()='code']")) ? AEC::EventCode.from_json_object_key?(n.content) : nil,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        not_after: Core::XMLValue.time(node.xpath_node("*[local-name()='notAfter']")),
        not_before: Core::XMLValue.time(node.xpath_node("*[local-name()='notBefore']")),
        not_before_deadline: Core::XMLValue.time(node.xpath_node("*[local-name()='notBeforeDeadline']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_event_id, @code, @description, @not_after, @not_before, @not_before_deadline)
  end
end
