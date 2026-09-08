private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the deregistered transit gateway multicast group sources.
  class TransitGatewayMulticastDeregisteredGroupSources
    # The ID of the transit gateway multicast domain.
    property transit_gateway_multicast_domain_id : String | Nil

    # The network interface IDs of the non-registered members.
    property deregistered_network_interface_ids : Array(String) | Nil

    # The IP address assigned to the transit gateway multicast group.
    property group_ip_address : String | Nil

    def initialize(
      @transit_gateway_multicast_domain_id : String | Nil = nil,
      @deregistered_network_interface_ids : Array(String) | Nil = nil,
      @group_ip_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_multicast_domain_id
        params << {"#{prefix}TransitGatewayMulticastDomainId", value}
      end

      (@deregistered_network_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DeregisteredNetworkInterfaceIds.#{i}", item}
      end

      if value = @group_ip_address
        params << {"#{prefix}GroupIpAddress", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_multicast_domain_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayMulticastDomainId']")),
        deregistered_network_interface_ids: node.xpath_nodes("*[local-name()='deregisteredNetworkInterfaceIds']/*[local-name()='item']").map { |n| n.content },
        group_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='groupIpAddress']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_multicast_domain_id, @deregistered_network_interface_ids, @group_ip_address)
  end
end
