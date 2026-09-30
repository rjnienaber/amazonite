private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the parameters for AssignPrivateIpAddresses.
  class AssignPrivateIpAddressesRequest
    # One or more IPv4 prefixes assigned to the network interface. You can't use this option if you
    # use the `Ipv4PrefixCount` option.
    property ipv_4_prefixes : Array(String) | Nil

    # The number of IPv4 prefixes that Amazon Web Services automatically assigns to the network
    # interface. You can't use this option if you use the `Ipv4 Prefixes` option.
    property ipv_4_prefix_count : Int32 | Nil

    # The ID of the network interface.
    property network_interface_id : String

    # The IP addresses to be assigned as a secondary private IP address to the network interface. You
    # can't specify this parameter when also specifying a number of secondary IP addresses.
    #
    # If you don't specify an IP address, Amazon EC2 automatically selects an IP address within the
    # subnet range.
    property private_ip_addresses : Array(String) | Nil

    # The number of secondary IP addresses to assign to the network interface. You can't specify this
    # parameter when also specifying private IP addresses.
    property secondary_private_ip_address_count : Int32 | Nil

    # Indicates whether to allow an IP address that is already assigned to another network interface
    # or instance to be reassigned to the specified network interface.
    property allow_reassignment : Bool | Nil

    def initialize(
      @network_interface_id : String,
      @ipv_4_prefixes : Array(String) | Nil = nil,
      @ipv_4_prefix_count : Int32 | Nil = nil,
      @private_ip_addresses : Array(String) | Nil = nil,
      @secondary_private_ip_address_count : Int32 | Nil = nil,
      @allow_reassignment : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipv_4_prefixes || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Ipv4Prefix.#{i}", item}
      end

      if value = @ipv_4_prefix_count
        params << {"#{prefix}Ipv4PrefixCount", value.to_s}
      end

      params << {"#{prefix}NetworkInterfaceId", @network_interface_id}

      (@private_ip_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PrivateIpAddress.#{i}", item}
      end

      if value = @secondary_private_ip_address_count
        params << {"#{prefix}SecondaryPrivateIpAddressCount", value.to_s}
      end

      if value = @allow_reassignment
        params << {"#{prefix}AllowReassignment", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_4_prefixes: node.xpath_nodes("*[local-name()='Ipv4Prefix']/*[local-name()='item']").map { |n| n.content },
        ipv_4_prefix_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv4PrefixCount']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")).not_nil!,
        private_ip_addresses: node.xpath_nodes("*[local-name()='privateIpAddress']/*[local-name()='PrivateIpAddress']").map { |n| n.content },
        secondary_private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='secondaryPrivateIpAddressCount']")),
        allow_reassignment: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowReassignment']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_4_prefixes, @ipv_4_prefix_count, @network_interface_id, @private_ip_addresses, @secondary_private_ip_address_count, @allow_reassignment)
  end
end
