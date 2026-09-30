private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the account-level VPC Encryption Control configuration, including its mode, state, and
  # exclusions.
  #
  # For more information, see [Enforce VPC encryption in
  # transit](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-encryption-controls.html) in the
  # *Amazon VPC User Guide*.
  class AccountVpcEncryptionControl
    # The current state of the account-level VPC Encryption Control configuration.
    property state : AccountVpcEncryptionControlState | Nil

    # The encryption mode for the account-level VPC Encryption Control configuration.
    property mode : AccountVpcEncryptionControlMode | Nil

    # Information about the traffic exclusions for the account-level VPC Encryption Control
    # configuration.
    property exclusions : AccountVpcEncryptionControlExclusions | Nil

    # The entity that manages the account-level VPC Encryption Control configuration.
    property managed_by : ManagedBy | Nil

    # The date and time when the account-level VPC Encryption Control configuration was last updated.
    property last_update_timestamp : Time | Nil

    def initialize(
      @state : AccountVpcEncryptionControlState | Nil = nil,
      @mode : AccountVpcEncryptionControlMode | Nil = nil,
      @exclusions : AccountVpcEncryptionControlExclusions | Nil = nil,
      @managed_by : ManagedBy | Nil = nil,
      @last_update_timestamp : Time | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @mode
        params << {"#{prefix}Mode", value.to_json_object_key}
      end

      if value = @exclusions
        params.concat(value.to_query_params("#{prefix}Exclusions."))
      end

      if value = @managed_by
        params << {"#{prefix}ManagedBy", value.to_json_object_key}
      end

      if value = @last_update_timestamp
        params << {"#{prefix}LastUpdateTimestamp", Core::QueryValue.time(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::AccountVpcEncryptionControlState.from_json_object_key?(n.content) : nil,
        mode: (n = node.xpath_node("*[local-name()='mode']")) ? AEC::AccountVpcEncryptionControlMode.from_json_object_key?(n.content) : nil,
        exclusions: node.xpath_node("*[local-name()='exclusions']").try { |n| AccountVpcEncryptionControlExclusions.from_xml(n) },
        managed_by: (n = node.xpath_node("*[local-name()='managedBy']")) ? AEC::ManagedBy.from_json_object_key?(n.content) : nil,
        last_update_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='lastUpdateTimestamp']")),
      )
    end

    def validate! : Nil
      if value = @exclusions
        value.validate!
      end
    end

    def_equals_and_hash(@state, @mode, @exclusions, @managed_by, @last_update_timestamp)
  end
end
