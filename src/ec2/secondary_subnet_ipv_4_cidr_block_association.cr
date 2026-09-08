private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv4 CIDR block associated with a secondary subnet.
  class SecondarySubnetIpv4CidrBlockAssociation
    # The association ID for the IPv4 CIDR block.
    property association_id : String | Nil

    # The IPv4 CIDR block.
    property cidr_block : String | Nil

    # The state of the CIDR block association.
    property state : SecondarySubnetCidrBlockAssociationState | Nil

    # The reason for the current state of the CIDR block association.
    property state_reason : String | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @cidr_block : String | Nil = nil,
      @state : SecondarySubnetCidrBlockAssociationState | Nil = nil,
      @state_reason : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_reason
        params << {"#{prefix}StateReason", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrBlock']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SecondarySubnetCidrBlockAssociationState.from_json_object_key?(n.content) : nil,
        state_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='stateReason']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@association_id, @cidr_block, @state, @state_reason)
  end
end
