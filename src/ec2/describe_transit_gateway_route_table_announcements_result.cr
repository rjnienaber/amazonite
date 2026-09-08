private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeTransitGatewayRouteTableAnnouncementsResult
    # Describes the transit gateway route table announcement.
    property transit_gateway_route_table_announcements : Array(TransitGatewayRouteTableAnnouncement) | Nil

    # The token for the next page of results.
    property next_token : String | Nil

    def initialize(
      @transit_gateway_route_table_announcements : Array(TransitGatewayRouteTableAnnouncement) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@transit_gateway_route_table_announcements || [] of TransitGatewayRouteTableAnnouncement).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TransitGatewayRouteTableAnnouncements.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_announcements: node.xpath_nodes("*[local-name()='transitGatewayRouteTableAnnouncements']/*[local-name()='item']").map { |n| TransitGatewayRouteTableAnnouncement.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @transit_gateway_route_table_announcements
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_announcements, @next_token)
  end
end
