private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the monitoring of an instance.
  class RunInstancesMonitoringEnabled
    # Indicates whether detailed monitoring is enabled. Otherwise, basic monitoring is enabled.
    property enabled : Bool

    def initialize(
      @enabled : Bool,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}Enabled", Core::QueryValue.bool(@enabled)}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='enabled']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled)
  end
end
