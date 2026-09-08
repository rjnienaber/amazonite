private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteTransitGatewayRouteTableAnnouncementResult
    # Provides details about a deleted transit gateway route table.
    property transit_gateway_route_table_announcement : TransitGatewayRouteTableAnnouncement | Nil

    def initialize(
      @transit_gateway_route_table_announcement : TransitGatewayRouteTableAnnouncement | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_route_table_announcement
        params.concat(value.to_query_params("#{prefix}TransitGatewayRouteTableAnnouncement."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_announcement: node.xpath_node("*[local-name()='transitGatewayRouteTableAnnouncement']").try { |n| TransitGatewayRouteTableAnnouncement.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @transit_gateway_route_table_announcement
        value.validate!
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_announcement)
  end
end
