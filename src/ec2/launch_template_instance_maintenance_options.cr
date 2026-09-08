private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The maintenance options of your instance.
  class LaunchTemplateInstanceMaintenanceOptions
    # Disables the automatic recovery behavior of your instance or sets it to default.
    property auto_recovery : LaunchTemplateAutoRecoveryState | Nil

    def initialize(
      @auto_recovery : LaunchTemplateAutoRecoveryState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @auto_recovery
        params << {"#{prefix}AutoRecovery", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        auto_recovery: (n = node.xpath_node("*[local-name()='autoRecovery']")) ? AEC::LaunchTemplateAutoRecoveryState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@auto_recovery)
  end
end
