private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Event filter allows you to focus on specific events in an operation.
  class EventFilter
    # When set to true, only returns failed events within the operation. This helps quickly identify
    # root causes for a failed operation.
    property failed_events : Bool | Nil

    def initialize(
      @failed_events : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @failed_events
        params << {"#{prefix}FailedEvents", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        failed_events: Core::XMLValue.bool(node.xpath_node("*[local-name()='FailedEvents']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@failed_events)
  end
end
