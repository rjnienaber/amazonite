private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a volume status operation code.
  class VolumeStatusAction
    # The code identifying the operation, for example, `enable-volume-io`.
    property code : String | Nil

    # A description of the operation.
    property description : String | Nil

    # The ID of the event associated with this operation.
    property event_id : String | Nil

    # The event type associated with this operation.
    property event_type : String | Nil

    def initialize(
      @code : String | Nil = nil,
      @description : String | Nil = nil,
      @event_id : String | Nil = nil,
      @event_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @code
        params << {"#{prefix}Code", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @event_id
        params << {"#{prefix}EventId", value}
      end

      if value = @event_type
        params << {"#{prefix}EventType", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        code: Core::XMLValue.string(node.xpath_node("*[local-name()='code']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        event_id: Core::XMLValue.string(node.xpath_node("*[local-name()='eventId']")),
        event_type: Core::XMLValue.string(node.xpath_node("*[local-name()='eventType']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @description, @event_id, @event_type)
  end
end
