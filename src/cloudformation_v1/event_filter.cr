private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class EventFilter
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
  end
end
