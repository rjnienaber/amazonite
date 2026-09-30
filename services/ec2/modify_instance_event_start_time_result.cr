private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyInstanceEventStartTimeResult
    # Information about the event.
    property event : InstanceStatusEvent | Nil

    def initialize(
      @event : InstanceStatusEvent | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @event
        params.concat(value.to_query_params("#{prefix}Event."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        event: node.xpath_node("*[local-name()='event']").try { |n| InstanceStatusEvent.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @event
        value.validate!
      end
    end

    def_equals_and_hash(@event)
  end
end
