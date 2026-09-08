private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The state of the event window.
  class InstanceEventWindowStateChange
    # The ID of the event window.
    property instance_event_window_id : String | Nil

    # The current state of the event window.
    property state : InstanceEventWindowState | Nil

    def initialize(
      @instance_event_window_id : String | Nil = nil,
      @state : InstanceEventWindowState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_event_window_id
        params << {"#{prefix}InstanceEventWindowId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_event_window_id: Core::XMLValue.string(node.xpath_node("*[local-name()='instanceEventWindowId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::InstanceEventWindowState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_event_window_id, @state)
  end
end
