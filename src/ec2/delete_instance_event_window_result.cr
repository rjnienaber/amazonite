private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteInstanceEventWindowResult
    # The state of the event window.
    property instance_event_window_state : InstanceEventWindowStateChange | Nil

    def initialize(
      @instance_event_window_state : InstanceEventWindowStateChange | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_event_window_state
        params.concat(value.to_query_params("#{prefix}InstanceEventWindowState."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_event_window_state: node.xpath_node("*[local-name()='instanceEventWindowState']").try { |n| InstanceEventWindowStateChange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @instance_event_window_state
        value.validate!
      end
    end

    def_equals_and_hash(@instance_event_window_state)
  end
end
