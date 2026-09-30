private alias Core = Amazonite::Core

module Amazonite::EC2
  # The parameters for a network interface.
  class LaunchTemplateInstanceNetworkInterfaceSpecificationRequest
    # Associates a Carrier IP address with eth0 for a new network interface.
    #
    # Use this option when you launch an instance in a Wavelength Zone and want to associate a Carrier
    # IP address with the network interface. For more information about Carrier IP addresses, see
    # [Carrier IP
    # addresses](https://docs.aws.amazon.com/wavelength/latest/developerguide/how-wavelengths-work.html#provider-owned-ip)
    # in the *Wavelength Developer Guide*.
    property associate_carrier_ip_address : Bool | Nil

    # Associates a public IPv4 address with eth0 for a new network interface.
    #
    # Amazon Web Services charges for all public IPv4 addresses, including public IPv4 addresses
    # associated with running instances and Elastic IP addresses. For more information, see the
    # *Public IPv4 Address* tab on the [Amazon VPC pricing page](http://aws.amazon.com/vpc/pricing/).
    property associate_public_ip_address : Bool | Nil

    # Indicates whether the network interface is deleted when the instance is terminated.
    property delete_on_termination : Bool | Nil

    # A description for the network interface.
    property description : String | Nil

    # The device index for the network interface attachment. The primary network interface has a
    # device index of 0. Each network interface is of type `interface`, you must specify a device
    # index. If you create a launch template that includes secondary network interfaces but not a
    # primary network interface, then you must add a primary network interface as a launch parameter
    # when you launch an instance from the template.
    property device_index : Int32 | Nil

    # The IDs of one or more security groups.
    property groups : Array(String) | Nil

    # The type of network interface. To create an Elastic Fabric Adapter (EFA), specify `efa` or
    # `efa`. For more information, see [Elastic Fabric Adapter for AI/ML and HPC workloads on Amazon
    # EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/efa.html) in the *Amazon EC2 User
    # Guide*.
    #
    # If you are not creating an EFA, specify `interface` or omit this parameter.
    #
    # If you specify `efa-only`, do not assign any IP addresses to the network interface. EFA-only
    # network interfaces do not support IP addresses.
    #
    # Valid values: `interface` | `efa` | `efa-only`
    property interface_type : String | Nil

    # The number of IPv6 addresses to assign to a network interface. Amazon EC2 automatically selects
    # the IPv6 addresses from the subnet range. You can't use this option if specifying specific IPv6
    # addresses.
    property ipv_6_address_count : Int32 | Nil

    # One or more specific IPv6 addresses from the IPv6 CIDR block range of your subnet. You can't use
    # this option if you're specifying a number of IPv6 addresses.
    property ipv_6_addresses : Array(InstanceIpv6AddressRequest) | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The primary private IPv4 address of the network interface.
    property private_ip_address : String | Nil

    # One or more private IPv4 addresses.
    property private_ip_addresses : Array(PrivateIpAddressSpecification) | Nil

    # The number of secondary private IPv4 addresses to assign to a network interface.
    property secondary_private_ip_address_count : Int32 | Nil

    # The ID of the subnet for the network interface.
    property subnet_id : String | Nil

    # The index of the network card. Some instance types support multiple network cards. The primary
    # network interface must be assigned to network card index 0. The default is network card index 0.
    property network_card_index : Int32 | Nil

    # One or more IPv4 prefixes to be assigned to the network interface. You cannot use this option if
    # you use the `Ipv4PrefixCount` option.
    property ipv_4_prefixes : Array(Ipv4PrefixSpecificationRequest) | Nil

    # The number of IPv4 prefixes to be automatically assigned to the network interface. You cannot
    # use this option if you use the `Ipv4Prefix` option.
    property ipv_4_prefix_count : Int32 | Nil

    # One or more IPv6 prefixes to be assigned to the network interface. You cannot use this option if
    # you use the `Ipv6PrefixCount` option.
    property ipv_6_prefixes : Array(Ipv6PrefixSpecificationRequest) | Nil

    # The number of IPv6 prefixes to be automatically assigned to the network interface. You cannot
    # use this option if you use the `Ipv6Prefix` option.
    property ipv_6_prefix_count : Int32 | Nil

    # The primary IPv6 address of the network interface. When you enable an IPv6 GUA address to be a
    # primary IPv6, the first IPv6 GUA will be made the primary IPv6 address until the instance is
    # terminated or the network interface is detached. For more information about primary IPv6
    # addresses, see
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html).
    property primary_ipv_6 : Bool | Nil

    # Configure ENA Express settings for your launch template.
    property ena_srd_specification : EnaSrdSpecificationRequest | Nil

    # A security group connection tracking specification that enables you to set the timeout for
    # connection tracking on an Elastic network interface. For more information, see [Idle connection
    # tracking
    # timeout](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#connection-tracking-timeouts)
    # in the *Amazon EC2 User Guide*.
    property connection_tracking_specification : ConnectionTrackingSpecificationRequest | Nil

    # The number of ENA queues to be created with the instance.
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
      @ipv_6_addresses : Array(InstanceIpv6AddressRequest) | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @private_ip_addresses : Array(PrivateIpAddressSpecification) | Nil = nil,
      @secondary_private_ip_address_count : Int32 | Nil = nil,
      @subnet_id : String | Nil = nil,
      @network_card_index : Int32 | Nil = nil,
      @ipv_4_prefixes : Array(Ipv4PrefixSpecificationRequest) | Nil = nil,
      @ipv_4_prefix_count : Int32 | Nil = nil,
      @ipv_6_prefixes : Array(Ipv6PrefixSpecificationRequest) | Nil = nil,
      @ipv_6_prefix_count : Int32 | Nil = nil,
      @primary_ipv_6 : Bool | Nil = nil,
      @ena_srd_specification : EnaSrdSpecificationRequest | Nil = nil,
      @connection_tracking_specification : ConnectionTrackingSpecificationRequest | Nil = nil,
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
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      if value = @interface_type
        params << {"#{prefix}InterfaceType", value}
      end

      if value = @ipv_6_address_count
        params << {"#{prefix}Ipv6AddressCount", value.to_s}
      end

      (@ipv_6_addresses || [] of InstanceIpv6AddressRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6Addresses.#{i}."))
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      (@private_ip_addresses || [] of PrivateIpAddressSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpAddresses.#{i}."))
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

      (@ipv_4_prefixes || [] of Ipv4PrefixSpecificationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv4Prefix.#{i}."))
      end

      if value = @ipv_4_prefix_count
        params << {"#{prefix}Ipv4PrefixCount", value.to_s}
      end

      (@ipv_6_prefixes || [] of Ipv6PrefixSpecificationRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6Prefix.#{i}."))
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
        associate_carrier_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='AssociateCarrierIpAddress']")),
        associate_public_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='AssociatePublicIpAddress']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='DeleteOnTermination']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='DeviceIndex']")),
        groups: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        interface_type: Core::XMLValue.string(node.xpath_node("*[local-name()='InterfaceType']")),
        ipv_6_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6AddressCount']")),
        ipv_6_addresses: node.xpath_nodes("*[local-name()='Ipv6Addresses']/*[local-name()='InstanceIpv6Address']").map { |n| InstanceIpv6AddressRequest.from_xml(n) },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkInterfaceId']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateIpAddress']")),
        private_ip_addresses: node.xpath_nodes("*[local-name()='PrivateIpAddresses']/*[local-name()='item']").map { |n| PrivateIpAddressSpecification.from_xml(n) },
        secondary_private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='SecondaryPrivateIpAddressCount']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        network_card_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='NetworkCardIndex']")),
        ipv_4_prefixes: node.xpath_nodes("*[local-name()='Ipv4Prefix']/*[local-name()='item']").map { |n| Ipv4PrefixSpecificationRequest.from_xml(n) },
        ipv_4_prefix_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv4PrefixCount']")),
        ipv_6_prefixes: node.xpath_nodes("*[local-name()='Ipv6Prefix']/*[local-name()='item']").map { |n| Ipv6PrefixSpecificationRequest.from_xml(n) },
        ipv_6_prefix_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6PrefixCount']")),
        primary_ipv_6: Core::XMLValue.bool(node.xpath_node("*[local-name()='PrimaryIpv6']")),
        ena_srd_specification: node.xpath_node("*[local-name()='EnaSrdSpecification']").try { |n| EnaSrdSpecificationRequest.from_xml(n) },
        connection_tracking_specification: node.xpath_node("*[local-name()='ConnectionTrackingSpecification']").try { |n| ConnectionTrackingSpecificationRequest.from_xml(n) },
        ena_queue_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='EnaQueueCount']")),
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
