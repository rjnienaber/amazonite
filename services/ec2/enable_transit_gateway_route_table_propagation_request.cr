private alias Core = Amazonite::Core

module Amazonite::EC2
  class EnableTransitGatewayRouteTablePropagationRequest
    # The ID of the propagation route table.
    property transit_gateway_route_table_id : String

    # The ID of the attachment.
    property transit_gateway_attachment_id : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the transit gateway route table announcement.
    property transit_gateway_route_table_announcement_id : String | Nil

    def initialize(
      @transit_gateway_route_table_id : String,
      @transit_gateway_attachment_id : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @transit_gateway_route_table_announcement_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayRouteTableId", @transit_gateway_route_table_id}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @transit_gateway_route_table_announcement_id
        params << {"#{prefix}TransitGatewayRouteTableAnnouncementId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayRouteTableId']")).not_nil!,
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAttachmentId']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        transit_gateway_route_table_announcement_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayRouteTableAnnouncementId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_route_table_id, @transit_gateway_attachment_id, @dry_run, @transit_gateway_route_table_announcement_id)
  end
end
