private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an event in the history of the Spot Fleet request.
  class HistoryRecord
    # Information about the event.
    property event_information : EventInformation | Nil

    # The event type.
    #
    # - `error` - An error with the Spot Fleet request.
    #
    # - `fleetRequestChange` - A change in the status or configuration of the Spot Fleet request.
    #
    # - `instanceChange` - An instance was launched or terminated.
    #
    # - `Information` - An informational event.
    property event_type : EventType | Nil

    # The date and time of the event, in UTC format (for example, *YYYY*-*MM*-*DD*T*HH*:*MM*:*SS*Z).
    property timestamp : Time | Nil

    def initialize(
      @event_information : EventInformation | Nil = nil,
      @event_type : EventType | Nil = nil,
      @timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @event_information
        params.concat(value.to_query_params("#{prefix}EventInformation."))
      end

      if value = @event_type
        params << {"#{prefix}EventType", value.to_json_object_key}
      end

      if value = @timestamp
        params << {"#{prefix}Timestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        event_information: node.xpath_node("*[local-name()='eventInformation']").try { |n| EventInformation.from_xml(n) },
        event_type: (n = node.xpath_node("*[local-name()='eventType']")) ? AEC::EventType.from_json_object_key?(n.content) : nil,
        timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='timestamp']")),
      )
    end

    def validate! : Nil
      if value = @event_information
        value.validate!
      end
    end

    def_equals_and_hash(@event_information, @event_type, @timestamp)
  end
end
