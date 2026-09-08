private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network interface.
  class NetworkInterface
    # The association information for an Elastic IP address (IPv4) associated with the network
    # interface.
    property association : NetworkInterfaceAssociation | Nil

    # The network interface attachment.
    property attachment : NetworkInterfaceAttachment | Nil

    # The Availability Zone.
    property availability_zone : String | Nil

    # A security group connection tracking configuration that enables you to set the timeout for
    # connection tracking on an Elastic network interface. For more information, see [Connection
    # tracking
    # timeouts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#connection-tracking-timeouts)
    # in the *Amazon EC2 User Guide*.
    property connection_tracking_configuration : ConnectionTrackingConfiguration | Nil

    # A description.
    property description : String | Nil

    # Any security groups for the network interface.
    property groups : Array(GroupIdentifier) | Nil

    # The type of network interface.
    property interface_type : NetworkInterfaceType | Nil

    # The IPv6 addresses associated with the network interface.
    property ipv_6_addresses : Array(NetworkInterfaceIpv6Address) | Nil

    # The MAC address.
    property mac_address : String | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost.
    property outpost_arn : String | Nil

    # The Amazon Web Services account ID of the owner of the network interface.
    property owner_id : String | Nil

    # The private hostname. For more information, see [EC2 instance hostnames, DNS names, and
    # domains](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-naming.html) in the
    # *Amazon EC2 User Guide*.
    property private_dns_name : String | Nil

    # A public hostname. For more information, see [EC2 instance hostnames, DNS names, and
    # domains](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-naming.html) in the
    # *Amazon EC2 User Guide*.
    property public_dns_name : String | Nil

    # Public hostname type options. For more information, see [EC2 instance hostnames, DNS names, and
    # domains](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-naming.html) in the
    # *Amazon EC2 User Guide*.
    property public_ip_dns_name_options : PublicIpDnsNameOptions | Nil

    # The IPv4 address of the network interface within the subnet.
    property private_ip_address : String | Nil

    # The private IPv4 addresses associated with the network interface.
    property private_ip_addresses : Array(NetworkInterfacePrivateIpAddress) | Nil

    # The IPv4 prefixes that are assigned to the network interface.
    property ipv_4_prefixes : Array(Ipv4PrefixSpecification) | Nil

    # The IPv6 prefixes that are assigned to the network interface.
    property ipv_6_prefixes : Array(Ipv6PrefixSpecification) | Nil

    # The alias or Amazon Web Services account ID of the principal or service that created the network
    # interface.
    property requester_id : String | Nil

    # Indicates whether the network interface is being managed by Amazon Web Services.
    property requester_managed : Bool | Nil

    # Indicates whether source/destination checking is enabled.
    property source_dest_check : Bool | Nil

    # The status of the network interface.
    property status : NetworkInterfaceStatus | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    # Any tags assigned to the network interface.
    property tag_set : Array(Tag) | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    # Indicates whether a network interface with an IPv6 address is unreachable from the public
    # internet. If the value is `true`, inbound traffic from the internet is dropped and you cannot
    # assign an elastic IP address to the network interface. The network interface is reachable from
    # peered VPCs and resources connected through a transit gateway, including on-premises networks.
    property deny_all_igw_traffic : Bool | Nil

    # Indicates whether this is an IPv6 only network interface.
    property ipv_6_native : Bool | Nil

    # The IPv6 globally unique address associated with the network interface.
    property ipv_6_address : String | Nil

    # The service provider that manages the network interface.
    property operator : OperatorResponse | Nil

    # The subnets associated with this network interface.
    property associated_subnets : Array(String) | Nil

    # The ID of the Availability Zone.
    property availability_zone_id : String | Nil

    def initialize(
      @association : NetworkInterfaceAssociation | Nil = nil,
      @attachment : NetworkInterfaceAttachment | Nil = nil,
      @availability_zone : String | Nil = nil,
      @connection_tracking_configuration : ConnectionTrackingConfiguration | Nil = nil,
      @description : String | Nil = nil,
      @groups : Array(GroupIdentifier) | Nil = nil,
      @interface_type : NetworkInterfaceType | Nil = nil,
      @ipv_6_addresses : Array(NetworkInterfaceIpv6Address) | Nil = nil,
      @mac_address : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @private_dns_name : String | Nil = nil,
      @public_dns_name : String | Nil = nil,
      @public_ip_dns_name_options : PublicIpDnsNameOptions | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @private_ip_addresses : Array(NetworkInterfacePrivateIpAddress) | Nil = nil,
      @ipv_4_prefixes : Array(Ipv4PrefixSpecification) | Nil = nil,
      @ipv_6_prefixes : Array(Ipv6PrefixSpecification) | Nil = nil,
      @requester_id : String | Nil = nil,
      @requester_managed : Bool | Nil = nil,
      @source_dest_check : Bool | Nil = nil,
      @status : NetworkInterfaceStatus | Nil = nil,
      @subnet_id : String | Nil = nil,
      @tag_set : Array(Tag) | Nil = nil,
      @vpc_id : String | Nil = nil,
      @deny_all_igw_traffic : Bool | Nil = nil,
      @ipv_6_native : Bool | Nil = nil,
      @ipv_6_address : String | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
      @associated_subnets : Array(String) | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association
        params.concat(value.to_query_params("#{prefix}Association."))
      end

      if value = @attachment
        params.concat(value.to_query_params("#{prefix}Attachment."))
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @connection_tracking_configuration
        params.concat(value.to_query_params("#{prefix}ConnectionTrackingConfiguration."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end

      if value = @interface_type
        params << {"#{prefix}InterfaceType", value.to_json_object_key}
      end

      (@ipv_6_addresses || [] of NetworkInterfaceIpv6Address).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6AddressesSet.#{i}."))
      end

      if value = @mac_address
        params << {"#{prefix}MacAddress", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end

      if value = @public_dns_name
        params << {"#{prefix}PublicDnsName", value}
      end

      if value = @public_ip_dns_name_options
        params.concat(value.to_query_params("#{prefix}PublicIpDnsNameOptions."))
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      (@private_ip_addresses || [] of NetworkInterfacePrivateIpAddress).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpAddressesSet.#{i}."))
      end

      (@ipv_4_prefixes || [] of Ipv4PrefixSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv4PrefixSet.#{i}."))
      end

      (@ipv_6_prefixes || [] of Ipv6PrefixSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6PrefixSet.#{i}."))
      end

      if value = @requester_id
        params << {"#{prefix}RequesterId", value}
      end

      if value = @requester_managed
        params << {"#{prefix}RequesterManaged", Core::QueryValue.bool(value)}
      end

      if value = @source_dest_check
        params << {"#{prefix}SourceDestCheck", Core::QueryValue.bool(value)}
      end

      if value = @status
        params << {"#{prefix}Status", value.to_json_object_key}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      (@tag_set || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @deny_all_igw_traffic
        params << {"#{prefix}DenyAllIgwTraffic", Core::QueryValue.bool(value)}
      end

      if value = @ipv_6_native
        params << {"#{prefix}Ipv6Native", Core::QueryValue.bool(value)}
      end

      if value = @ipv_6_address
        params << {"#{prefix}Ipv6Address", value}
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      (@associated_subnets || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AssociatedSubnetSet.#{i}", item}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association: node.xpath_node("*[local-name()='association']").try { |n| NetworkInterfaceAssociation.from_xml(n) },
        attachment: node.xpath_node("*[local-name()='attachment']").try { |n| NetworkInterfaceAttachment.from_xml(n) },
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        connection_tracking_configuration: node.xpath_node("*[local-name()='connectionTrackingConfiguration']").try { |n| ConnectionTrackingConfiguration.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
        interface_type: (n = node.xpath_node("*[local-name()='interfaceType']")) ? AEC::NetworkInterfaceType.from_json_object_key?(n.content) : nil,
        ipv_6_addresses: node.xpath_nodes("*[local-name()='ipv6AddressesSet']/*[local-name()='item']").map { |n| NetworkInterfaceIpv6Address.from_xml(n) },
        mac_address: Core::XMLValue.string(node.xpath_node("*[local-name()='macAddress']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDnsName']")),
        public_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='publicDnsName']")),
        public_ip_dns_name_options: node.xpath_node("*[local-name()='publicIpDnsNameOptions']").try { |n| PublicIpDnsNameOptions.from_xml(n) },
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        private_ip_addresses: node.xpath_nodes("*[local-name()='privateIpAddressesSet']/*[local-name()='item']").map { |n| NetworkInterfacePrivateIpAddress.from_xml(n) },
        ipv_4_prefixes: node.xpath_nodes("*[local-name()='ipv4PrefixSet']/*[local-name()='item']").map { |n| Ipv4PrefixSpecification.from_xml(n) },
        ipv_6_prefixes: node.xpath_nodes("*[local-name()='ipv6PrefixSet']/*[local-name()='item']").map { |n| Ipv6PrefixSpecification.from_xml(n) },
        requester_id: Core::XMLValue.string(node.xpath_node("*[local-name()='requesterId']")),
        requester_managed: Core::XMLValue.bool(node.xpath_node("*[local-name()='requesterManaged']")),
        source_dest_check: Core::XMLValue.bool(node.xpath_node("*[local-name()='sourceDestCheck']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::NetworkInterfaceStatus.from_json_object_key?(n.content) : nil,
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        tag_set: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        deny_all_igw_traffic: Core::XMLValue.bool(node.xpath_node("*[local-name()='denyAllIgwTraffic']")),
        ipv_6_native: Core::XMLValue.bool(node.xpath_node("*[local-name()='ipv6Native']")),
        ipv_6_address: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6Address']")),
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
        associated_subnets: node.xpath_nodes("*[local-name()='associatedSubnetSet']/*[local-name()='item']").map { |n| n.content },
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
      )
    end

    def validate! : Nil
      if value = @association
        value.validate!
      end

      if value = @attachment
        value.validate!
      end

      if value = @connection_tracking_configuration
        value.validate!
      end

      if value = @groups
        value.each(&.validate!)
      end

      if value = @ipv_6_addresses
        value.each(&.validate!)
      end

      if value = @public_ip_dns_name_options
        value.validate!
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

      if value = @tag_set
        value.each(&.validate!)
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@association, @attachment, @availability_zone, @connection_tracking_configuration, @description, @groups, @interface_type, @ipv_6_addresses, @mac_address, @network_interface_id, @outpost_arn, @owner_id, @private_dns_name, @public_dns_name, @public_ip_dns_name_options, @private_ip_address, @private_ip_addresses, @ipv_4_prefixes, @ipv_6_prefixes, @requester_id, @requester_managed, @source_dest_check, @status, @subnet_id, @tag_set, @vpc_id, @deny_all_igw_traffic, @ipv_6_native, @ipv_6_address, @operator, @associated_subnets, @availability_zone_id)
  end
end
