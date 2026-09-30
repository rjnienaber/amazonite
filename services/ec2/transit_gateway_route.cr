private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a route for a transit gateway route table.
  class TransitGatewayRoute
    # The CIDR block used for destination matches.
    property destination_cidr_block : String | Nil

    # The ID of the prefix list used for destination matches.
    property prefix_list_id : String | Nil

    # The ID of the transit gateway route table announcement.
    property transit_gateway_route_table_announcement_id : String | Nil

    # The attachments.
    property transit_gateway_attachments : Array(TransitGatewayRouteAttachment) | Nil

    # The route type.
    property type : TransitGatewayRouteType | Nil

    # The state of the route.
    property state : TransitGatewayRouteState | Nil

    def initialize(
      @destination_cidr_block : String | Nil = nil,
      @prefix_list_id : String | Nil = nil,
      @transit_gateway_route_table_announcement_id : String | Nil = nil,
      @transit_gateway_attachments : Array(TransitGatewayRouteAttachment) | Nil = nil,
      @type : TransitGatewayRouteType | Nil = nil,
      @state : TransitGatewayRouteState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @destination_cidr_block
        params << {"#{prefix}DestinationCidrBlock", value}
      end

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end

      if value = @transit_gateway_route_table_announcement_id
        params << {"#{prefix}TransitGatewayRouteTableAnnouncementId", value}
      end

      (@transit_gateway_attachments || [] of TransitGatewayRouteAttachment).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TransitGatewayAttachments.#{i}."))
      end

      if value = @type
        params << {"#{prefix}Type", value.to_json_object_key}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='destinationCidrBlock']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        transit_gateway_route_table_announcement_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayRouteTableAnnouncementId']")),
        transit_gateway_attachments: node.xpath_nodes("*[local-name()='transitGatewayAttachments']/*[local-name()='item']").map { |n| TransitGatewayRouteAttachment.from_xml(n) },
        type: (n = node.xpath_node("*[local-name()='type']")) ? AEC::TransitGatewayRouteType.from_json_object_key?(n.content) : nil,
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayRouteState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
      if value = @transit_gateway_attachments
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@destination_cidr_block, @prefix_list_id, @transit_gateway_route_table_announcement_id, @transit_gateway_attachments, @type, @state)
  end
end
