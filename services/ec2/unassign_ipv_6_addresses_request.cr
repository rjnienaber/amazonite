private alias Core = Amazonite::Core

module Amazonite::EC2
  class UnassignIpv6AddressesRequest
    # The IPv6 prefixes to unassign from the network interface.
    property ipv_6_prefixes : Array(String) | Nil

    # The ID of the network interface.
    property network_interface_id : String

    # The IPv6 addresses to unassign from the network interface.
    property ipv_6_addresses : Array(String) | Nil

    def initialize(
      @network_interface_id : String,
      @ipv_6_prefixes : Array(String) | Nil = nil,
      @ipv_6_addresses : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipv_6_prefixes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Ipv6Prefix.#{i}", item}
      end

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      (@ipv_6_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Ipv6Addresses.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_prefixes: node.xpath_nodes("*[local-name()='Ipv6Prefix']/*[local-name()='item']").map { |n| n.content },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")).not_nil!,
        ipv_6_addresses: node.xpath_nodes("*[local-name()='ipv6Addresses']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_6_prefixes, @network_interface_id, @ipv_6_addresses)
  end
end
