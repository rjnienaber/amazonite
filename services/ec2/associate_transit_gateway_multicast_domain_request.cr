private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateTransitGatewayMulticastDomainRequest
    # The ID of the transit gateway multicast domain.
    property transit_gateway_multicast_domain_id : String

    # The ID of the transit gateway attachment to associate with the transit gateway multicast domain.
    property transit_gateway_attachment_id : String

    # The IDs of the subnets to associate with the transit gateway multicast domain.
    property subnet_ids : Array(String) = [] of String

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_multicast_domain_id : String,
      @transit_gateway_attachment_id : String,
      @subnet_ids : Array(String),
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}TransitGatewayMulticastDomainId", @transit_gateway_multicast_domain_id}

      params << {"#{prefix}TransitGatewayAttachmentId", @transit_gateway_attachment_id}

      @subnet_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetIds.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_multicast_domain_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayMulticastDomainId']")).not_nil!,
        transit_gateway_attachment_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayAttachmentId']")).not_nil!,
        subnet_ids: node.xpath_nodes("*[local-name()='SubnetIds']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_multicast_domain_id, @transit_gateway_attachment_id, @subnet_ids, @dry_run)
  end
end
