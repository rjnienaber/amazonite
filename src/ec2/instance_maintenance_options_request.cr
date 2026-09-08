private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The maintenance options for the instance.
  class InstanceMaintenanceOptionsRequest
    # Disables the automatic recovery behavior of your instance or sets it to default. For more
    # information, see [Simplified automatic
    # recovery](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-recover.html#instance-configuration-recovery).
    property auto_recovery : InstanceAutoRecoveryState | Nil

    def initialize(
      @auto_recovery : InstanceAutoRecoveryState | Nil = nil,
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
        auto_recovery: (n = node.xpath_node("*[local-name()='AutoRecovery']")) ? AEC::InstanceAutoRecoveryState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@auto_recovery)
  end
end
