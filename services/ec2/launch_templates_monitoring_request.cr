private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the monitoring for the instance.
  class LaunchTemplatesMonitoringRequest
    # Specify `true` to enable detailed monitoring. Otherwise, basic monitoring is enabled.
    property enabled : Bool | Nil

    def initialize(
      @enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enabled
        params << {"#{prefix}Enabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='Enabled']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@enabled)
  end
end
