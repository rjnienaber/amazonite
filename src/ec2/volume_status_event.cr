private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a volume status event.
  class VolumeStatusEvent
    # A description of the event.
    property description : String | Nil

    # The ID of this event.
    property event_id : String | Nil

    # The type of this event.
    property event_type : String | Nil

    # The latest end time of the event.
    property not_after : Time | Nil

    # The earliest start time of the event.
    property not_before : Time | Nil

    # The ID of the instance associated with the event.
    property instance_id : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @event_id : String | Nil = nil,
      @event_type : String | Nil = nil,
      @not_after : Time | Nil = nil,
      @not_before : Time | Nil = nil,
      @instance_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @event_id
        params << {"#{prefix}EventId", value}
      end

      if value = @event_type
        params << {"#{prefix}EventType", value}
      end

      if value = @not_after
        params << {"#{prefix}NotAfter", Core::QueryValue.time(value)}
      end

      if value = @not_before
        params << {"#{prefix}NotBefore", Core::QueryValue.time(value)}
      end

      if value = @instance_id
        params << {"#{prefix}InstanceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        event_id: Core::XMLValue.string(node.xpath_node("*[local-name()='eventId']")),
        event_type: Core::XMLValue.string(node.xpath_node("*[local-name()='eventType']")),
        not_after: Core::XMLValue.time(node.xpath_node("*[local-name()='notAfter']")),
        not_before: Core::XMLValue.time(node.xpath_node("*[local-name()='notBefore']")),
        instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@description, @event_id, @event_type, @not_after, @not_before, @instance_id)
  end
end
