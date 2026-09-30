private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssignPrivateIpAddressesResult
    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The private IP addresses assigned to the network interface.
    property assigned_private_ip_addresses : Array(AssignedPrivateIpAddress) | Nil

    # The IPv4 prefixes that are assigned to the network interface.
    property assigned_ipv_4_prefixes : Array(Ipv4PrefixSpecification) | Nil

    def initialize(
      @network_interface_id : String | Nil = nil,
      @assigned_private_ip_addresses : Array(AssignedPrivateIpAddress) | Nil = nil,
      @assigned_ipv_4_prefixes : Array(Ipv4PrefixSpecification) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      (@assigned_private_ip_addresses || [] of AssignedPrivateIpAddress).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AssignedPrivateIpAddressesSet.#{i}."))
      end

      (@assigned_ipv_4_prefixes || [] of Ipv4PrefixSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AssignedIpv4PrefixSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        assigned_private_ip_addresses: node.xpath_nodes("*[local-name()='assignedPrivateIpAddressesSet']/*[local-name()='item']").map { |n| AssignedPrivateIpAddress.from_xml(n) },
        assigned_ipv_4_prefixes: node.xpath_nodes("*[local-name()='assignedIpv4PrefixSet']/*[local-name()='item']").map { |n| Ipv4PrefixSpecification.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @assigned_private_ip_addresses
        value.each(&.validate!)
      end

      if value = @assigned_ipv_4_prefixes
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@network_interface_id, @assigned_private_ip_addresses, @assigned_ipv_4_prefixes)
  end
end
