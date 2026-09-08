private alias Core = Amazonite::Core

module Amazonite::EC2
  class UnassignIpv6AddressesResult
    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The IPv6 addresses that have been unassigned from the network interface.
    property unassigned_ipv_6_addresses : Array(String) | Nil

    # The IPv6 prefixes that have been unassigned from the network interface.
    property unassigned_ipv_6_prefixes : Array(String) | Nil

    def initialize(
      @network_interface_id : String | Nil = nil,
      @unassigned_ipv_6_addresses : Array(String) | Nil = nil,
      @unassigned_ipv_6_prefixes : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      (@unassigned_ipv_6_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UnassignedIpv6Addresses.#{i}", item}
      end

      (@unassigned_ipv_6_prefixes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}UnassignedIpv6PrefixSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        unassigned_ipv_6_addresses: node.xpath_nodes("*[local-name()='unassignedIpv6Addresses']/*[local-name()='item']").map { |n| n.content },
        unassigned_ipv_6_prefixes: node.xpath_nodes("*[local-name()='unassignedIpv6PrefixSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@network_interface_id, @unassigned_ipv_6_addresses, @unassigned_ipv_6_prefixes)
  end
end
