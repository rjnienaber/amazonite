private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeregisterTransitGatewayMulticastGroupMembersRequest
    # The ID of the transit gateway multicast domain.
    property transit_gateway_multicast_domain_id : String | Nil

    # The IP address assigned to the transit gateway multicast group.
    property group_ip_address : String | Nil

    # The IDs of the group members' network interfaces.
    property network_interface_ids : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @transit_gateway_multicast_domain_id : String | Nil = nil,
      @group_ip_address : String | Nil = nil,
      @network_interface_ids : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_multicast_domain_id
        params << {"#{prefix}TransitGatewayMulticastDomainId", value}
      end

      if value = @group_ip_address
        params << {"#{prefix}GroupIpAddress", value}
      end

      (@network_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkInterfaceIds.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_multicast_domain_id: Core::XMLValue.string(node.xpath_node("*[local-name()='TransitGatewayMulticastDomainId']")),
        group_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='GroupIpAddress']")),
        network_interface_ids: node.xpath_nodes("*[local-name()='NetworkInterfaceIds']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_multicast_domain_id, @group_ip_address, @network_interface_ids, @dry_run)
  end
end
