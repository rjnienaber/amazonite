private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the subnet association with the transit gateway multicast domain.
  class SubnetAssociation
    # The ID of the subnet.
    property subnet_id : String | Nil

    # The state of the subnet association.
    property state : TransitGatewayMulitcastDomainAssociationState | Nil

    def initialize(
      @subnet_id : String | Nil = nil,
      @state : TransitGatewayMulitcastDomainAssociationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayMulitcastDomainAssociationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@subnet_id, @state)
  end
end
