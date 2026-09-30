private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a propagation route table.
  class TransitGatewayAttachmentPropagation
    # The ID of the propagation route table.
    property transit_gateway_route_table_id : String | Nil

    # The state of the propagation route table.
    property state : TransitGatewayPropagationState | Nil

    def initialize(
      @transit_gateway_route_table_id : String | Nil = nil,
      @state : TransitGatewayPropagationState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_route_table_id
        params << {"#{prefix}TransitGatewayRouteTableId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayRouteTableId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayPropagationState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_route_table_id, @state)
  end
end
