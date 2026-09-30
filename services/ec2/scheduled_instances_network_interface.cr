private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network interface for a Scheduled Instance.
  class ScheduledInstancesNetworkInterface
    # Indicates whether to assign a public IPv4 address to instances launched in a VPC. The public
    # IPv4 address can only be assigned to a network interface for eth0, and can only be assigned to a
    # new network interface, not an existing one. You cannot specify more than one network interface
    # in the request. If launching into a default subnet, the default value is `true`.
    #
    # Amazon Web Services charges for all public IPv4 addresses, including public IPv4 addresses
    # associated with running instances and Elastic IP addresses. For more information, see the
    # *Public IPv4 Address* tab on the [Amazon VPC pricing page](http://aws.amazon.com/vpc/pricing/).
    property associate_public_ip_address : Bool | Nil

    # Indicates whether to delete the interface when the instance is terminated.
    property delete_on_termination : Bool | Nil

    # The description.
    property description : String | Nil

    # The index of the device for the network interface attachment.
    property device_index : Int32 | Nil

    # The IDs of the security groups.
    property groups : Array(String) | Nil

    # The number of IPv6 addresses to assign to the network interface. The IPv6 addresses are
    # automatically selected from the subnet range.
    property ipv_6_address_count : Int32 | Nil

    # The specific IPv6 addresses from the subnet range.
    property ipv_6_addresses : Array(ScheduledInstancesIpv6Address) | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The IPv4 address of the network interface within the subnet.
    property private_ip_address : String | Nil

    # The private IPv4 addresses.
    property private_ip_address_configs : Array(ScheduledInstancesPrivateIpAddressConfig) | Nil

    # The number of secondary private IPv4 addresses.
    property secondary_private_ip_address_count : Int32 | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    def initialize(
      @associate_public_ip_address : Bool | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @description : String | Nil = nil,
      @device_index : Int32 | Nil = nil,
      @groups : Array(String) | Nil = nil,
      @ipv_6_address_count : Int32 | Nil = nil,
      @ipv_6_addresses : Array(ScheduledInstancesIpv6Address) | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @private_ip_address_configs : Array(ScheduledInstancesPrivateIpAddressConfig) | Nil = nil,
      @secondary_private_ip_address_count : Int32 | Nil = nil,
      @subnet_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @associate_public_ip_address
        params << {"#{prefix}AssociatePublicIpAddress", Core::QueryValue.bool(value)}
      end

      if value = @delete_on_termination
        params << {"#{prefix}DeleteOnTermination", Core::QueryValue.bool(value)}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @device_index
        params << {"#{prefix}DeviceIndex", value.to_s}
      end

      (@groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Group.#{i}", item}
      end

      if value = @ipv_6_address_count
        params << {"#{prefix}Ipv6AddressCount", value.to_s}
      end

      (@ipv_6_addresses || [] of ScheduledInstancesIpv6Address).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6Address.#{i}."))
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      (@private_ip_address_configs || [] of ScheduledInstancesPrivateIpAddressConfig).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpAddressConfig.#{i}."))
      end

      if value = @secondary_private_ip_address_count
        params << {"#{prefix}SecondaryPrivateIpAddressCount", value.to_s}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associate_public_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='AssociatePublicIpAddress']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteOnTermination']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='DeviceIndex']")),
        groups: node.xpath_nodes("*[local-name()='Group']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        ipv_6_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6AddressCount']")),
        ipv_6_addresses: node.xpath_nodes("*[local-name()='Ipv6Address']/*[local-name()='Ipv6Address']").map { |n| ScheduledInstancesIpv6Address.from_xml(n) },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfaceId']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateIpAddress']")),
        private_ip_address_configs: node.xpath_nodes("*[local-name()='PrivateIpAddressConfig']/*[local-name()='PrivateIpAddressConfigSet']").map { |n| ScheduledInstancesPrivateIpAddressConfig.from_xml(n) },
        secondary_private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='SecondaryPrivateIpAddressCount']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_addresses
        value.each(&.validate!)
      end

      if value = @private_ip_address_configs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@associate_public_ip_address, @delete_on_termination, @description, @device_index, @groups, @ipv_6_address_count, @ipv_6_addresses, @network_interface_id, @private_ip_address, @private_ip_address_configs, @secondary_private_ip_address_count, @subnet_id)
  end
end
