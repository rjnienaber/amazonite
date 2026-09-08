private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network interface.
  class InstanceNetworkInterfaceSpecification
    # Indicates whether to assign a public IPv4 address to an instance you launch in a VPC. The public
    # IP address can only be assigned to a network interface for eth0, and can only be assigned to a
    # new network interface, not an existing one. You cannot specify more than one network interface
    # in the request. If launching into a default subnet, the default value is `true`.
    #
    # Amazon Web Services charges for all public IPv4 addresses, including public IPv4 addresses
    # associated with running instances and Elastic IP addresses. For more information, see the
    # *Public IPv4 Address* tab on the [Amazon VPC pricing page](http://aws.amazon.com/vpc/pricing/).
    property associate_public_ip_address : Bool | Nil

    # If set to `true`, the interface is deleted when the instance is terminated. You can specify
    # `true` only if creating a new network interface when launching an instance.
    property delete_on_termination : Bool | Nil

    # The description of the network interface. Applies only if creating a network interface when
    # launching an instance.
    property description : String | Nil

    # The position of the network interface in the attachment order. A primary network interface has a
    # device index of 0.
    #
    # If you specify a network interface when launching an instance, you must specify the device
    # index.
    property device_index : Int32 | Nil

    # The IDs of the security groups for the network interface. Applies only if creating a network
    # interface when launching an instance.
    property groups : Array(String) | Nil

    # A number of IPv6 addresses to assign to the network interface. Amazon EC2 chooses the IPv6
    # addresses from the range of the subnet. You cannot specify this option and the option to assign
    # specific IPv6 addresses in the same request. You can specify this option if you've specified a
    # minimum number of instances to launch.
    property ipv_6_address_count : Int32 | Nil

    # The IPv6 addresses to assign to the network interface. You cannot specify this option and the
    # option to assign a number of IPv6 addresses in the same request. You cannot specify this option
    # if you've specified a minimum number of instances to launch.
    property ipv_6_addresses : Array(InstanceIpv6Address) | Nil

    # The ID of the network interface.
    #
    # If you are creating a Spot Fleet, omit this parameter because you can’t specify a network
    # interface ID in a launch specification.
    property network_interface_id : String | Nil

    # The private IPv4 address of the network interface. Applies only if creating a network interface
    # when launching an instance. You cannot specify this option if you're launching more than one
    # instance in a
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html)
    # request.
    property private_ip_address : String | Nil

    # The private IPv4 addresses to assign to the network interface. Only one private IPv4 address can
    # be designated as primary. You cannot specify this option if you're launching more than one
    # instance in a
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html)
    # request.
    property private_ip_addresses : Array(PrivateIpAddressSpecification) | Nil

    # The number of secondary private IPv4 addresses. You can’t specify this parameter and also
    # specify a secondary private IP address using the `PrivateIpAddress` parameter.
    property secondary_private_ip_address_count : Int32 | Nil

    # The ID of the subnet associated with the network interface. Applies only if creating a network
    # interface when launching an instance.
    property subnet_id : String | Nil

    # Indicates whether to assign a carrier IP address to the network interface.
    #
    # You can only assign a carrier IP address to a network interface that is in a subnet in a
    # Wavelength Zone. For more information about carrier IP addresses, see [Carrier IP
    # address](https://docs.aws.amazon.com/wavelength/latest/developerguide/how-wavelengths-work.html#provider-owned-ip)
    # in the *Amazon Web Services Wavelength Developer Guide*.
    property associate_carrier_ip_address : Bool | Nil

    # The type of network interface.
    #
    # If you specify `efa-only`, do not assign any IP addresses to the network interface. EFA-only
    # network interfaces do not support IP addresses.
    #
    # Valid values: `interface` | `efa` | `efa-only`
    property interface_type : String | Nil

    # The index of the network card. Some instance types support multiple network cards. The primary
    # network interface must be assigned to network card index 0. The default is network card index 0.
    #
    # If you are using
    # [RequestSpotInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RequestSpotInstances.html)
    # to create Spot Instances, omit this parameter because you can’t specify the network card index
    # when using this API. To specify the network card index, use
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html).
    property network_card_index : Int32 | Nil

    # The IPv4 delegated prefixes to be assigned to the network interface. You cannot use this option
    # if you use the `Ipv4PrefixCount` option.
    property ipv_4_prefixes : Array(Ipv4PrefixSpecificationRequest) | Nil

    # The number of IPv4 delegated prefixes to be automatically assigned to the network interface. You
    # cannot use this option if you use the `Ipv4Prefix` option.
    property ipv_4_prefix_count : Int32 | Nil

    # The IPv6 delegated prefixes to be assigned to the network interface. You cannot use this option
    # if you use the `Ipv6PrefixCount` option.
    property ipv_6_prefixes : Array(Ipv6PrefixSpecificationRequest) | Nil

    # The number of IPv6 delegated prefixes to be automatically assigned to the network interface. You
    # cannot use this option if you use the `Ipv6Prefix` option.
    property ipv_6_prefix_count : Int32 | Nil

    # The primary IPv6 address of the network interface. When you enable an IPv6 GUA address to be a
    # primary IPv6, the first IPv6 GUA will be made the primary IPv6 address until the instance is
    # terminated or the network interface is detached. For more information about primary IPv6
    # addresses, see
    # [RunInstances](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RunInstances.html).
    property primary_ipv_6 : Bool | Nil

    # Specifies the ENA Express settings for the network interface that's attached to the instance.
    property ena_srd_specification : EnaSrdSpecificationRequest | Nil

    # A security group connection tracking specification that enables you to set the timeout for
    # connection tracking on an Elastic network interface. For more information, see [Connection
    # tracking
    # timeouts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#connection-tracking-timeouts)
    # in the *Amazon EC2 User Guide*.
    property connection_tracking_specification : ConnectionTrackingSpecificationRequest | Nil

    # The number of ENA queues to be created with the instance.
    property ena_queue_count : Int32 | Nil

    def initialize(
      @associate_public_ip_address : Bool | Nil = nil,
      @delete_on_termination : Bool | Nil = nil,
      @description : String | Nil = nil,
      @device_index : Int32 | Nil = nil,
      @groups : Array(String) | Nil = nil,
      @ipv_6_address_count : Int32 | Nil = nil,
      @ipv_6_addresses : Array(InstanceIpv6Address) | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @private_ip_addresses : Array(PrivateIpAddressSpecification) | Nil = nil,
      @secondary_private_ip_address_count : Int32 | Nil = nil,
      @subnet_id : String | Nil = nil,
      @associate_carrier_ip_address : Bool | Nil = nil,
      @interface_type : String | Nil = nil,
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

      if value = @ipv_6_address_count
        params << {"#{prefix}Ipv6AddressCount", value.to_s}
      end

      (@ipv_6_addresses || [] of InstanceIpv6Address).each_with_index(1) do |item, i|
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

      if value = @associate_carrier_ip_address
        params << {"#{prefix}AssociateCarrierIpAddress", Core::QueryValue.bool(value)}
      end

      if value = @interface_type
        params << {"#{prefix}InterfaceType", value}
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
        associate_public_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='associatePublicIpAddress']")),
        delete_on_termination: Core::XMLValue.bool(node.xpath_node("*[local-name()='deleteOnTermination']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='deviceIndex']")),
        groups: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        ipv_6_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv6AddressCount']")),
        ipv_6_addresses: node.xpath_nodes("*[local-name()='ipv6AddressesSet']/*[local-name()='item']").map { |n| InstanceIpv6Address.from_xml(n) },
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        private_ip_addresses: node.xpath_nodes("*[local-name()='privateIpAddressesSet']/*[local-name()='item']").map { |n| PrivateIpAddressSpecification.from_xml(n) },
        secondary_private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='secondaryPrivateIpAddressCount']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        associate_carrier_ip_address: Core::XMLValue.bool(node.xpath_node("*[local-name()='AssociateCarrierIpAddress']")),
        interface_type: Core::XMLValue.string(node.xpath_node("*[local-name()='InterfaceType']")),
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

    def_equals_and_hash(@associate_public_ip_address, @delete_on_termination, @description, @device_index, @groups, @ipv_6_address_count, @ipv_6_addresses, @network_interface_id, @private_ip_address, @private_ip_addresses, @secondary_private_ip_address_count, @subnet_id, @associate_carrier_ip_address, @interface_type, @network_card_index, @ipv_4_prefixes, @ipv_4_prefix_count, @ipv_6_prefixes, @ipv_6_prefix_count, @primary_ipv_6, @ena_srd_specification, @connection_tracking_specification, @ena_queue_count)
  end
end
