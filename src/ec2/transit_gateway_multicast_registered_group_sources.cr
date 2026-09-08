private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the members registered with the transit gateway multicast group.
  class TransitGatewayMulticastRegisteredGroupSources
    # The ID of the transit gateway multicast domain.
    property transit_gateway_multicast_domain_id : String | Nil

    # The IDs of the network interfaces members registered with the transit gateway multicast group.
    property registered_network_interface_ids : Array(String) | Nil

    # The IP address assigned to the transit gateway multicast group.
    property group_ip_address : String | Nil

    def initialize(
      @transit_gateway_multicast_domain_id : String | Nil = nil,
      @registered_network_interface_ids : Array(String) | Nil = nil,
      @group_ip_address : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @transit_gateway_multicast_domain_id
        params << {"#{prefix}TransitGatewayMulticastDomainId", value}
      end

      (@registered_network_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RegisteredNetworkInterfaceIds.#{i}", item}
      end

      if value = @group_ip_address
        params << {"#{prefix}GroupIpAddress", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        transit_gateway_multicast_domain_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayMulticastDomainId']")),
        registered_network_interface_ids: node.xpath_nodes("*[local-name()='registeredNetworkInterfaceIds']/*[local-name()='item']").map { |n| n.content },
        group_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='groupIpAddress']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@transit_gateway_multicast_domain_id, @registered_network_interface_ids, @group_ip_address)
  end
end
