private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssignIpv6AddressesResult
    # The new IPv6 addresses assigned to the network interface. Existing IPv6 addresses that were
    # assigned to the network interface before the request are not included.
    property assigned_ipv_6_addresses : Array(String) | Nil

    # The IPv6 prefixes that are assigned to the network interface.
    property assigned_ipv_6_prefixes : Array(String) | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    def initialize(
      @assigned_ipv_6_addresses : Array(String) | Nil = nil,
      @assigned_ipv_6_prefixes : Array(String) | Nil = nil,
      @network_interface_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@assigned_ipv_6_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AssignedIpv6Addresses.#{i}", item}
      end

      (@assigned_ipv_6_prefixes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AssignedIpv6PrefixSet.#{i}", item}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        assigned_ipv_6_addresses: node.xpath_nodes("*[local-name()='assignedIpv6Addresses']/*[local-name()='item']").map { |n| n.content },
        assigned_ipv_6_prefixes: node.xpath_nodes("*[local-name()='assignedIpv6PrefixSet']/*[local-name()='item']").map { |n| n.content },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@assigned_ipv_6_addresses, @assigned_ipv_6_prefixes, @network_interface_id)
  end
end
