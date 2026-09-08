private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network interface.
  class LaunchTemplateInstanceNetworkInterfaceSpecification
    # Indicates whether to associate a Carrier IP address with eth0 for a new network interface.
    #
    # Use this option when you launch an instance in a Wavelength Zone and want to associate a Carrier
    # IP address with the network interface. For more information about Carrier IP addresses, see
    # [Carrier IP
    # address](https://docs.aws.amazon.com/wavelength/latest/developerguide/how-wavelengths-work.html#provider-owned-ip)
    # in the *Wavelength Developer Guide*.
    property associate_carrier_ip_address : Bool | Nil

    # Indicates whether to associate a public IPv4 address with eth0 for a new network interface.
    #
    # Amazon Web Services charges for all public IPv4 addresses, including public IPv4 addresses
    # associated with running instances and Elastic IP addresses. For more information, see the
    # *Public IPv4 Address* tab on the [Amazon VPC pricing page](http://aws.amazon.com/vpc/pricing/).
    property associate_public_ip_address : Bool | Nil

    # Indicates whether the network interface is deleted when the instance is terminated.
    property delete_on_termination : Bool | Nil

    # A description for the network interface.
    property description : String | Nil

    # The device index for the network interface attachment.
    property device_index : Int32 | Nil

    # The IDs of one or more security groups.
    property groups : Array(String) | Nil

    # The type of network interface.
    property interface_type : String | Nil

    # The number of IPv6 addresses for the network interface.
    property ipv_6_address_count : Int32 | Nil

    # The IPv6 addresses for the network interface.
    property ipv_6_addresses : Array(InstanceIpv6Address) | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The primary private IPv4 address of the network interface.
    property private_ip_address : String | Nil

    # One or more private IPv4 addresses.
    property private_ip_addresses : Array(PrivateIpAddressSpecification) | Nil

    # The number of secondary private IPv4 addresses for the network interface.
    property secondary_private_ip_address_count : Int32 | Nil

    # The ID of the subnet for the network interface.
    property subnet_id : String | Nil

    # The index of the network card.
    property network_card_index : Int32 | Nil

    # One or more IPv4 prefixes assigned to the network interface.
    property ipv_4_prefixes : Array(Ipv4PrefixSpecificationResponse) | Nil

    # The number of IPv4 prefixes that Amazon Web Services automatically assigned to the network
    # interface.
    property ipv_4_prefix_count : Int32 | Nil

    # One or more IPv6 prefixes assigned to the network interface.
    property ipv_6_prefixes : Array(Ipv6PrefixSpecificationResponse) | Nil

    # The number of IPv6 prefixes that Amazon Web Services automatically assigned to the network
    # interface.
    property ipv_6_prefix_count : Int32 | Nil

    # The primary IPv6 address of the network interface. When you enable an IPv6 GUA address to be a
    # primary IPv6, the first IPv6 GUA will be made the primary IPv6 address until the instance is
    # terminated or the network interface is detached. For more information about primary IPv6
    # addresses, see
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html).
    property primary_ipv_6 : Bool | Nil

    # Contains the ENA Express settings for instances launched from your launch template.
    property ena_srd_specification : LaunchTemplateEnaSrdSpecification | Nil

    # A security group connection tracking specification that enables you to set the timeout for
    # connection tracking on an Elastic network interface. For more information, see [Idle connection
    # tracking
    # timeout](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#connection-tracking-timeouts)
    # in the *Amazon EC2 User Guide*.
    property connection_tracking_specification : ConnectionTrackingSpecification | Nil

    # The number of ENA queues created with the instance.
    property ena_queue_count : Int32 | Nil

    def initialize(
      @associate_carrier_ip_address : Bool | Nil = nil,
      @associate_public_ip_address : Bool | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @description : String | Nil = nil,
      @device_index : Int32 | Nil = nil,
      @groups : Array(String) | Nil = nil,
      @interface_type : String | Nil = nil,
      @ipv_6_address_count : Int32 | Nil = nil,
      @ipv_6_addresses : Array(InstanceIpv6Address) | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @private_ip_addresses : Array(PrivateIpAddressSpecification) | Nil = nil,
      @secondary_private_ip_address_count : Int32 | Nil = nil,
      @subnet_id : String | Nil = nil,
      @network_card_index : Int32 | Nil = nil,
      @ipv_4_prefixes : Array(Ipv4PrefixSpecificationResponse) | Nil = nil,
      @ipv_4_prefix_count : Int32 | Nil = nil,
      @ipv_6_prefixes : Array(Ipv6PrefixSpecificationResponse) | Nil = nil,
      @ipv_6_prefix_count : Int32 | Nil = nil,
      @primary_ipv_6 : Bool | Nil = nil,
      @ena_srd_specification : LaunchTemplateEnaSrdSpecification | Nil = nil,
      @connection_tracking_specification : ConnectionTrackingSpecification | Nil = nil,
      @ena_queue_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @associate_carrier_ip_address
        params << {"#{prefix}AssociateCarrierIpAddress", Core::QueryValue.bool(value)}
      end

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
        params << {"#{prefix}GroupSet.#{i}", item}
      end

      if value = @interface_type
        params << {"#{prefix}InterfaceType", value}
      end

      if value = @ipv_6_address_count
        params << {"#{prefix}Ipv6AddressCount", value.to_s}
      end

      (@ipv_6_addresses || [] of InstanceIpv6Address).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6AddressesSet.#{i}."))
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      (@private_ip_addresses || [] of PrivateIpAddressSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpAddressesSet.#{i}."))
      end

      if value = @secondary_private_ip_address_count
        params << {"#{prefix}SecondaryPrivateIpAddressCount", value.to_s}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @network_card_index
        params << {"#{prefix}NetworkCardIndex", value.to_s}
      end

      (@ipv_4_prefixes || [] of Ipv4PrefixSpecificationResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv4PrefixSet.#{i}."))
      end

      if value = @ipv_4_prefix_count
        params << {"#{prefix}Ipv4PrefixCount", value.to_s}
      end

      (@ipv_6_prefixes || [] of Ipv6PrefixSpecificationResponse).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6PrefixSet.#{i}."))
      end

      if value = @ipv_6_prefix_count
        params << {"#{prefix}Ipv6PrefixCount", value.to_s}
      end

      if value = @primary_ipv_6
        params << {"#{prefix}PrimaryIpv6", Core::QueryValue.bool(value)}
      end

      if value = @ena_srd_specification
        params.concat(value.to_query_params("#{prefix}EnaSrdSpecification."))
      end

      if value = @connection_tracking_specification
        params.concat(value.to_query_params("#{prefix}ConnectionTrackingSpecification."))
      end

      if value = @ena_queue_count
        params << {"#{prefix}EnaQueueCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        associate_carrier_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='associateCarrierIpAddress']")),
        associate_public_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='associatePublicIpAddress']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='deviceIndex']")),
        groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='groupId']").map { |n| n.content },
        interface_type: Core::XMLValue.string(node.xpath_node("*[local-name()='interfaceType']")),
        ipv_6_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv6AddressCount']")),
        ipv_6_addresses: node.xpath_nodes("*[local-name()='ipv6AddressesSet']/*[local-name()='item']").map { |n| InstanceIpv6Address.from_xml(n) },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        private_ip_addresses: node.xpath_nodes("*[local-name()='privateIpAddressesSet']/*[local-name()='item']").map { |n| PrivateIpAddressSpecification.from_xml(n) },
        secondary_private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='secondaryPrivateIpAddressCount']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='networkCardIndex']")),
        ipv_4_prefixes: node.xpath_nodes("*[local-name()='ipv4PrefixSet']/*[local-name()='item']").map { |n| Ipv4PrefixSpecificationResponse.from_xml(n) },
        ipv_4_prefix_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv4PrefixCount']")),
        ipv_6_prefixes: node.xpath_nodes("*[local-name()='ipv6PrefixSet']/*[local-name()='item']").map { |n| Ipv6PrefixSpecificationResponse.from_xml(n) },
        ipv_6_prefix_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv6PrefixCount']")),
        primary_ipv_6: Core::XMLValue.bool(node.xpath_node("*[local-name()='primaryIpv6']")),
        ena_srd_specification: node.xpath_node("*[local-name()='enaSrdSpecification']").try { |n| LaunchTemplateEnaSrdSpecification.from_xml(n) },
        connection_tracking_specification: node.xpath_node("*[local-name()='connectionTrackingSpecification']").try { |n| ConnectionTrackingSpecification.from_xml(n) },
        ena_queue_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='enaQueueCount']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_addresses
        value.each(&.validate!)
      end

      if value = @private_ip_addresses
        value.each(&.validate!)
      end

      if value = @ipv_4_prefixes
        value.each(&.validate!)
      end

      if value = @ipv_6_prefixes
        value.each(&.validate!)
      end

      if value = @ena_srd_specification
        value.validate!
      end

      if value = @connection_tracking_specification
        value.validate!
      end
    end

    def_equals_and_hash(@associate_carrier_ip_address, @associate_public_ip_address, @delete_on_termination, @description, @device_index, @groups, @interface_type, @ipv_6_address_count, @ipv_6_addresses, @network_interface_id, @private_ip_address, @private_ip_addresses, @secondary_private_ip_address_count, @subnet_id, @network_card_index, @ipv_4_prefixes, @ipv_4_prefix_count, @ipv_6_prefixes, @ipv_6_prefix_count, @primary_ipv_6, @ena_srd_specification, @connection_tracking_specification, @ena_queue_count)
  end
end
