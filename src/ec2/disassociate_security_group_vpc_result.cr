private alias AEC = Amazonite::EC2

module Amazonite::EC2
  class DisassociateSecurityGroupVpcResult
    # The state of the disassociation.
    property state : SecurityGroupVpcAssociationState | Nil

    def initialize(
      @state : SecurityGroupVpcAssociationState | Nil = nil,
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
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SecurityGroupVpcAssociationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@state)
  end
end
