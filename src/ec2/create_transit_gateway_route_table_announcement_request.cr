private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateTransitGatewayRouteTableAnnouncementRequest
    # The ID of the transit gateway route table.
    property transit_gateway_route_table_id : String

    # The ID of the peering attachment.
    property peering_attachment_id : String

    # The tags specifications applied to the transit gateway route table announcement.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_route_table_id : String,
      @peering_attachment_id : String,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayRouteTableId", @transit_gateway_route_table_id}

      params << {"#{prefix}PeeringAttachmentId", @peering_attachment_id}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayRouteTableId']")).not_nil!,
        peering_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PeeringAttachmentId']")).not_nil!,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@transit_gateway_route_table_id, @peering_attachment_id, @tag_specifications, @dry_run)
  end
end
