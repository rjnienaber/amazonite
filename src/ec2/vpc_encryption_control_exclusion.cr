private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an exclusion configuration for VPC Encryption Control.
  #
  # For more information, see [Enforce VPC encryption in
  # transit](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-encryption-controls.html) in the
  # *Amazon VPC User Guide*.
  class VpcEncryptionControlExclusion
    # The current state of the exclusion configuration.
    property state : VpcEncryptionControlExclusionState | Nil

    # A message providing additional information about the exclusion state.
    property state_message : String | Nil

    def initialize(
      @state : VpcEncryptionControlExclusionState | Nil = nil,
      @state_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::VpcEncryptionControlExclusionState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state, @state_message)
  end
end
