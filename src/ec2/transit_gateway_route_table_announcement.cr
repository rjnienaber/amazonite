private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a transit gateway route table announcement.
  class TransitGatewayRouteTableAnnouncement
    # The ID of the transit gateway route table announcement.
    property transit_gateway_route_table_announcement_id : String | Nil

    # The ID of the transit gateway.
    property transit_gateway_id : String | Nil

    # The ID of the core network for the transit gateway route table announcement.
    property core_network_id : String | Nil

    # The ID of the peer transit gateway.
    property peer_transit_gateway_id : String | Nil

    # The ID of the core network ID for the peer.
    property peer_core_network_id : String | Nil

    # The ID of the peering attachment.
    property peering_attachment_id : String | Nil

    # The direction for the route table announcement.
    property announcement_direction : TransitGatewayRouteTableAnnouncementDirection | Nil

    # The ID of the transit gateway route table.
    property transit_gateway_route_table_id : String | Nil

    # The state of the transit gateway announcement.
    property state : TransitGatewayRouteTableAnnouncementState | Nil

    # The timestamp when the transit gateway route table announcement was created.
    property creation_time : Time | Nil

    # The key-value pairs associated with the route table announcement.
    property tags : Array(Tag) | Nil

    def initialize(
      @transit_gateway_route_table_announcement_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
      @core_network_id : String | Nil = nil,
      @peer_transit_gateway_id : String | Nil = nil,
      @peer_core_network_id : String | Nil = nil,
      @peering_attachment_id : String | Nil = nil,
      @announcement_direction : TransitGatewayRouteTableAnnouncementDirection | Nil = nil,
      @transit_gateway_route_table_id : String | Nil = nil,
      @state : TransitGatewayRouteTableAnnouncementState | Nil = nil,
      @creation_time : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_route_table_announcement_id
        params << {"#{prefix}TransitGatewayRouteTableAnnouncementId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end

      if value = @core_network_id
        params << {"#{prefix}CoreNetworkId", value}
      end

      if value = @peer_transit_gateway_id
        params << {"#{prefix}PeerTransitGatewayId", value}
      end

      if value = @peer_core_network_id
        params << {"#{prefix}PeerCoreNetworkId", value}
      end

      if value = @peering_attachment_id
        params << {"#{prefix}PeeringAttachmentId", value}
      end

      if value = @announcement_direction
        params << {"#{prefix}AnnouncementDirection", value.to_json_object_key}
      end

      if value = @transit_gateway_route_table_id
        params << {"#{prefix}TransitGatewayRouteTableId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @creation_time
        params << {"#{prefix}CreationTime", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_announcement_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayRouteTableAnnouncementId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
        core_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='coreNetworkId']")),
        peer_transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='peerTransitGatewayId']")),
        peer_core_network_id: Core::XMLValue.string(node.xpath_node("*[local-name()='peerCoreNetworkId']")),
        peering_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='peeringAttachmentId']")),
        announcement_direction: (n = node.xpath_node("*[local-name()='announcementDirection']")) ? AEC::TransitGatewayRouteTableAnnouncementDirection.from_json_object_key?(n.content) : nil,
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayRouteTableId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayRouteTableAnnouncementState.from_json_object_key?(n.content) : nil,
        creation_time: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTime']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_announcement_id, @transit_gateway_id, @core_network_id, @peer_transit_gateway_id, @peer_core_network_id, @peering_attachment_id, @announcement_direction, @transit_gateway_route_table_id, @state, @creation_time, @tags)
  end
end
