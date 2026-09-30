private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the monitoring of an instance.
  class Monitoring
    # Indicates whether detailed monitoring is enabled. Otherwise, basic monitoring is enabled.
    property state : MonitoringState | Nil

    def initialize(
      @state : MonitoringState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::MonitoringState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state)
  end
end
