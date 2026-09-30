private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network interface.
  class InstanceNetworkInterface
    # The association information for an Elastic IPv4 associated with the network interface.
    property association : InstanceNetworkInterfaceAssociation | Nil

    # The network interface attachment.
    property attachment : InstanceNetworkInterfaceAttachment | Nil

    # The description.
    property description : String | Nil

    # The security groups.
    property groups : Array(GroupIdentifier) | Nil

    # The IPv6 addresses associated with the network interface.
    property ipv_6_addresses : Array(InstanceIpv6Address) | Nil

    # The MAC address.
    property mac_address : String | Nil

    # The ID of the network interface.
    property network_interface_id : String | Nil

    # The ID of the Amazon Web Services account that created the network interface.
    property owner_id : String | Nil

    # The private DNS name.
    property private_dns_name : String | Nil

    # The IPv4 address of the network interface within the subnet.
    property private_ip_address : String | Nil

    # The private IPv4 addresses associated with the network interface.
    property private_ip_addresses : Array(InstancePrivateIpAddress) | Nil

    # Indicates whether source/destination checking is enabled.
    property source_dest_check : Bool | Nil

    # The status of the network interface.
    property status : NetworkInterfaceStatus | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    # The type of network interface.
    #
    # Valid values: `interface` | `efa` | `efa-only` | `evs` | `trunk`
    property interface_type : String | Nil

    # The IPv4 delegated prefixes that are assigned to the network interface.
    property ipv_4_prefixes : Array(InstanceIpv4Prefix) | Nil

    # The IPv6 delegated prefixes that are assigned to the network interface.
    property ipv_6_prefixes : Array(InstanceIpv6Prefix) | Nil

    # A security group connection tracking configuration that enables you to set the timeout for
    # connection tracking on an Elastic network interface. For more information, see [Connection
    # tracking
    # timeouts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#connection-tracking-timeouts)
    # in the *Amazon EC2 User Guide*.
    property connection_tracking_configuration : ConnectionTrackingSpecificationResponse | Nil

    # The service provider that manages the network interface.
    property operator : OperatorResponse | Nil

    def initialize(
      @association : InstanceNetworkInterfaceAssociation | Nil = nil,
      @attachment : InstanceNetworkInterfaceAttachment | Nil = nil,
      @description : String | Nil = nil,
      @groups : Array(GroupIdentifier) | Nil = nil,
      @ipv_6_addresses : Array(InstanceIpv6Address) | Nil = nil,
      @mac_address : String | Nil = nil,
      @network_interface_id : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @private_dns_name : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @private_ip_addresses : Array(InstancePrivateIpAddress) | Nil = nil,
      @source_dest_check : Bool | Nil = nil,
      @status : NetworkInterfaceStatus | Nil = nil,
      @subnet_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @interface_type : String | Nil = nil,
      @ipv_4_prefixes : Array(InstanceIpv4Prefix) | Nil = nil,
      @ipv_6_prefixes : Array(InstanceIpv6Prefix) | Nil = nil,
      @connection_tracking_configuration : ConnectionTrackingSpecificationResponse | Nil = nil,
      @operator : OperatorResponse | Nil = nil,
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

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@groups || [] of GroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end

      (@ipv_6_addresses || [] of InstanceIpv6Address).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6AddressesSet.#{i}."))
      end

      if value = @mac_address
        params << {"#{prefix}MacAddress", value}
      end

      if value = @network_interface_id
        params << {"#{prefix}NetworkInterfaceId", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      (@private_ip_addresses || [] of InstancePrivateIpAddress).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpAddressesSet.#{i}."))
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

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @interface_type
        params << {"#{prefix}InterfaceType", value}
      end

      (@ipv_4_prefixes || [] of InstanceIpv4Prefix).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv4PrefixSet.#{i}."))
      end

      (@ipv_6_prefixes || [] of InstanceIpv6Prefix).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6PrefixSet.#{i}."))
      end

      if value = @connection_tracking_configuration
        params.concat(value.to_query_params("#{prefix}ConnectionTrackingConfiguration."))
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association: node.xpath_node("*[local-name()='association']").try { |n| InstanceNetworkInterfaceAssociation.from_xml(n) },
        attachment: node.xpath_node("*[local-name()='attachment']").try { |n| InstanceNetworkInterfaceAttachment.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| GroupIdentifier.from_xml(n) },
        ipv_6_addresses: node.xpath_nodes("*[local-name()='ipv6AddressesSet']/*[local-name()='item']").map { |n| InstanceIpv6Address.from_xml(n) },
        mac_address: Core::XMLValue.string(node.xpath_node("*[local-name()='macAddress']")),
        network_interface_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkInterfaceId']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDnsName']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        private_ip_addresses: node.xpath_nodes("*[local-name()='privateIpAddressesSet']/*[local-name()='item']").map { |n| InstancePrivateIpAddress.from_xml(n) },
        source_dest_check: Core::XMLValue.bool(node.xpath_node("*[local-name()='sourceDestCheck']")),
        status: (n = node.xpath_node("*[local-name()='status']")) ? AEC::NetworkInterfaceStatus.from_json_object_key?(n.content) : nil,
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        interface_type: Core::XMLValue.string(node.xpath_node("*[local-name()='interfaceType']")),
        ipv_4_prefixes: node.xpath_nodes("*[local-name()='ipv4PrefixSet']/*[local-name()='item']").map { |n| InstanceIpv4Prefix.from_xml(n) },
        ipv_6_prefixes: node.xpath_nodes("*[local-name()='ipv6PrefixSet']/*[local-name()='item']").map { |n| InstanceIpv6Prefix.from_xml(n) },
        connection_tracking_configuration: node.xpath_node("*[local-name()='connectionTrackingConfiguration']").try { |n| ConnectionTrackingSpecificationResponse.from_xml(n) },
        operator: node.xpath_node("*[local-name()='operator']").try { |n| OperatorResponse.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @association
        value.validate!
      end

      if value = @attachment
        value.validate!
      end

      if value = @groups
        value.each(&.validate!)
      end

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

      if value = @connection_tracking_configuration
        value.validate!
      end

      if value = @operator
        value.validate!
      end
    end

    def_equals_and_hash(@association, @attachment, @description, @groups, @ipv_6_addresses, @mac_address, @network_interface_id, @owner_id, @private_dns_name, @private_ip_address, @private_ip_addresses, @source_dest_check, @status, @subnet_id, @vpc_id, @interface_type, @ipv_4_prefixes, @ipv_6_prefixes, @connection_tracking_configuration, @operator)
  end
end
