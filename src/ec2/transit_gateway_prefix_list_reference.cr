private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a prefix list reference.
  class TransitGatewayPrefixListReference
    # The ID of the transit gateway route table.
    property transit_gateway_route_table_id : String | Nil

    # The ID of the prefix list.
    property prefix_list_id : String | Nil

    # The ID of the prefix list owner.
    property prefix_list_owner_id : String | Nil

    # The state of the prefix list reference.
    property state : TransitGatewayPrefixListReferenceState | Nil

    # Indicates whether traffic that matches this route is dropped.
    property blackhole : Bool | Nil

    # Information about the transit gateway attachment.
    property transit_gateway_attachment : TransitGatewayPrefixListAttachment | Nil

    def initialize(
      @transit_gateway_route_table_id : String | Nil = nil,
      @prefix_list_id : String | Nil = nil,
      @prefix_list_owner_id : String | Nil = nil,
      @state : TransitGatewayPrefixListReferenceState | Nil = nil,
      @blackhole : Bool | Nil = nil,
      @transit_gateway_attachment : TransitGatewayPrefixListAttachment | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_route_table_id
        params << {"#{prefix}TransitGatewayRouteTableId", value}
      end

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end

      if value = @prefix_list_owner_id
        params << {"#{prefix}PrefixListOwnerId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @blackhole
        params << {"#{prefix}Blackhole", Core::QueryValue.bool(value)}
      end

      if value = @transit_gateway_attachment
        params.concat(value.to_query_params("#{prefix}TransitGatewayAttachment."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayRouteTableId']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        prefix_list_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListOwnerId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayPrefixListReferenceState.from_json_object_key?(n.content) : nil,
        blackhole: Core::XMLValue.bool(node.xpath_node("*[local-name()='blackhole']")),
        transit_gateway_attachment: node.xpath_node("*[local-name()='transitGatewayAttachment']").try { |n| TransitGatewayPrefixListAttachment.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_attachment
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_id, @prefix_list_id, @prefix_list_owner_id, @state, @blackhole, @transit_gateway_attachment)
  end
end
