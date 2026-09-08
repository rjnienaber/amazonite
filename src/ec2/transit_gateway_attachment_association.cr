private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an association.
  class TransitGatewayAttachmentAssociation
    # The ID of the route table for the transit gateway.
    property transit_gateway_route_table_id : String | Nil

    # The ID of the transit gateway policy table associated with the attachment.
    property transit_gateway_policy_table_id : String | Nil

    # The state of the association.
    property state : TransitGatewayAssociationState | Nil

    def initialize(
      @transit_gateway_route_table_id : String | Nil = nil,
      @transit_gateway_policy_table_id : String | Nil = nil,
      @state : TransitGatewayAssociationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_route_table_id
        params << {"#{prefix}TransitGatewayRouteTableId", value}
      end

      if value = @transit_gateway_policy_table_id
        params << {"#{prefix}TransitGatewayPolicyTableId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayRouteTableId']")),
        transit_gateway_policy_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayPolicyTableId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayAssociationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_route_table_id, @transit_gateway_policy_table_id, @state)
  end
end
