private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for UnassignPrivateIpAddresses.
  class UnassignPrivateIpAddressesRequest
    # The IPv4 prefixes to unassign from the network interface.
    property ipv_4_prefixes : Array(String) | Nil

    # The ID of the network interface.
    property network_interface_id : String

    # The secondary private IP addresses to unassign from the network interface. You can specify this
    # option multiple times to unassign more than one IP address.
    property private_ip_addresses : Array(String) | Nil

    def initialize(
      @network_interface_id : String,
      @ipv_4_prefixes : Array(String) | Nil = nil,
      @private_ip_addresses : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipv_4_prefixes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Ipv4Prefix.#{i}", item}
      end

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      (@private_ip_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PrivateIpAddress.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_4_prefixes: node.xpath_nodes("*[local-name()='Ipv4Prefix']/*[local-name()='item']").map { |n| n.content },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")).not_nil!,
        private_ip_addresses: node.xpath_nodes("*[local-name()='privateIpAddress']/*[local-name()='PrivateIpAddress']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_4_prefixes, @network_interface_id, @private_ip_addresses)
  end
end
