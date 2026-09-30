private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssignIpv6AddressesRequest
    # The number of IPv6 prefixes that Amazon Web Services automatically assigns to the network
    # interface. You cannot use this option if you use the `Ipv6Prefixes` option.
    property ipv_6_prefix_count : Int32 | Nil

    # One or more IPv6 prefixes assigned to the network interface. You can't use this option if you
    # use the `Ipv6PrefixCount` option.
    property ipv_6_prefixes : Array(String) | Nil

    # The ID of the network interface.
    property network_interface_id : String

    # The IPv6 addresses to be assigned to the network interface. You can't use this option if you're
    # specifying a number of IPv6 addresses.
    property ipv_6_addresses : Array(String) | Nil

    # The number of additional IPv6 addresses to assign to the network interface. The specified number
    # of IPv6 addresses are assigned in addition to the existing IPv6 addresses that are already
    # assigned to the network interface. Amazon EC2 automatically selects the IPv6 addresses from the
    # subnet range. You can't use this option if specifying specific IPv6 addresses.
    property ipv_6_address_count : Int32 | Nil

    def initialize(
      @network_interface_id : String,
      @ipv_6_prefix_count : Int32 | Nil = nil,
      @ipv_6_prefixes : Array(String) | Nil = nil,
      @ipv_6_addresses : Array(String) | Nil = nil,
      @ipv_6_address_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_prefix_count
        params << {"#{prefix}Ipv6PrefixCount", value.to_s}
      end

      (@ipv_6_prefixes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Ipv6Prefix.#{i}", item}
      end

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      (@ipv_6_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Ipv6Addresses.#{i}", item}
      end

      if value = @ipv_6_address_count
        params << {"#{prefix}Ipv6AddressCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_prefix_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6PrefixCount']")),
        ipv_6_prefixes: node.xpath_nodes("*[local-name()='Ipv6Prefix']/*[local-name()='item']").map { |n| n.content },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")).not_nil!,
        ipv_6_addresses: node.xpath_nodes("*[local-name()='ipv6Addresses']/*[local-name()='item']").map { |n| n.content },
        ipv_6_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv6AddressCount']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_6_prefix_count, @ipv_6_prefixes, @network_interface_id, @ipv_6_addresses, @ipv_6_address_count)
  end
end
