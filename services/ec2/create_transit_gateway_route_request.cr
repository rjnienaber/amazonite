private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayRouteRequest
    # The CIDR range used for destination matches. Routing decisions are based on the most specific
    # match.
    property destination_cidr_block : String

    # The ID of the transit gateway route table.
    property transit_gateway_route_table_id : String

    # The ID of the attachment.
    property transit_gateway_attachment_id : String | Nil

    # Indicates whether to drop traffic that matches this route.
    property blackhole : Bool | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @destination_cidr_block : String,
      @transit_gateway_route_table_id : String,
      @transit_gateway_attachment_id : String | Nil = nil,
      @blackhole : Bool | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}DestinationCidrBlock", @destination_cidr_block}

      params << {"#{prefix}TransitGatewayRouteTableId", @transit_gateway_route_table_id}

      if value = @transit_gateway_attachment_id
        params << {"#{prefix}TransitGatewayAttachmentId", value}
      end

      if value = @blackhole
        params << {"#{prefix}Blackhole", Core::QueryValue.bool(value)}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        destination_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='DestinationCidrBlock']")).not_nil!,
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayRouteTableId']")).not_nil!,
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAttachmentId']")),
        blackhole: Core::XMLValue.bool(node.xpath_node("*[local-name()='Blackhole']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@destination_cidr_block, @transit_gateway_route_table_id, @transit_gateway_attachment_id, @blackhole, @dry_run)
  end
end
