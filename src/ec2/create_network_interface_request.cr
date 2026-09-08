private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkInterfaceRequest
    # The IPv4 prefixes assigned to the network interface.
    #
    # You can't specify IPv4 prefixes if you've specified one of the following: a count of IPv4
    # prefixes, specific private IPv4 addresses, or a count of private IPv4 addresses.
    property ipv_4_prefixes : Array(Ipv4PrefixSpecificationRequest) | Nil

    # The number of IPv4 prefixes that Amazon Web Services automatically assigns to the network
    # interface.
    #
    # You can't specify a count of IPv4 prefixes if you've specified one of the following: specific
    # IPv4 prefixes, specific private IPv4 addresses, or a count of private IPv4 addresses.
    property ipv_4_prefix_count : Int32 | Nil

    # The IPv6 prefixes assigned to the network interface.
    #
    # You can't specify IPv6 prefixes if you've specified one of the following: a count of IPv6
    # prefixes, specific IPv6 addresses, or a count of IPv6 addresses.
    property ipv_6_prefixes : Array(Ipv6PrefixSpecificationRequest) | Nil

    # The number of IPv6 prefixes that Amazon Web Services automatically assigns to the network
    # interface.
    #
    # You can't specify a count of IPv6 prefixes if you've specified one of the following: specific
    # IPv6 prefixes, specific IPv6 addresses, or a count of IPv6 addresses.
    property ipv_6_prefix_count : Int32 | Nil

    # The type of network interface. The default is `interface`.
    #
    # If you specify `efa-only`, do not assign any IP addresses to the network interface. EFA-only
    # network interfaces do not support IP addresses.
    #
    # The only supported values are `interface`, `efa`, `efa-only`, and `trunk`.
    property interface_type : NetworkInterfaceCreationType | Nil

    # The tags to apply to the new network interface.
    property tag_specifications : Array(TagSpecification) | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    property client_token : String | Nil

    # If you’re creating a network interface in a dual-stack or IPv6-only subnet, you have the option
    # to assign a primary IPv6 IP address. A primary IPv6 address is an IPv6 GUA address associated
    # with an ENI that you have enabled to use a primary IPv6 address. Use this option if the instance
    # that this ENI will be attached to relies on its IPv6 address not changing. Amazon Web Services
    # will automatically assign an IPv6 address associated with the ENI attached to your instance to
    # be the primary IPv6 address. Once you enable an IPv6 GUA address to be a primary IPv6, you
    # cannot disable it. When you enable an IPv6 GUA address to be a primary IPv6, the first IPv6 GUA
    # will be made the primary IPv6 address until the instance is terminated or the network interface
    # is detached. If you have multiple IPv6 addresses associated with an ENI attached to your
    # instance and you enable a primary IPv6 address, the first IPv6 GUA address associated with the
    # ENI becomes the primary IPv6 address.
    property enable_primary_ipv_6 : Bool | Nil

    # A connection tracking specification for the network interface.
    property connection_tracking_specification : ConnectionTrackingSpecificationRequest | Nil

    # Reserved for internal use.
    property operator : OperatorRequest | Nil

    # The ID of the subnet to associate with the network interface.
    property subnet_id : String

    # A description for the network interface.
    property description : String | Nil

    # The primary private IPv4 address of the network interface. If you don't specify an IPv4 address,
    # Amazon EC2 selects one for you from the subnet's IPv4 CIDR range. If you specify an IP address,
    # you cannot indicate any IP addresses specified in `privateIpAddresses` as primary (only one IP
    # address can be designated as primary).
    property private_ip_address : String | Nil

    # The IDs of the security groups.
    property groups : Array(String) | Nil

    # The private IPv4 addresses.
    #
    # You can't specify private IPv4 addresses if you've specified one of the following: a count of
    # private IPv4 addresses, specific IPv4 prefixes, or a count of IPv4 prefixes.
    property private_ip_addresses : Array(PrivateIpAddressSpecification) | Nil

    # The number of secondary private IPv4 addresses to assign to a network interface. When you
    # specify a number of secondary IPv4 addresses, Amazon EC2 selects these IP addresses within the
    # subnet's IPv4 CIDR range. You can't specify this option and specify more than one private IP
    # address using `privateIpAddresses`.
    #
    # You can't specify a count of private IPv4 addresses if you've specified one of the following:
    # specific private IPv4 addresses, specific IPv4 prefixes, or a count of IPv4 prefixes.
    property secondary_private_ip_address_count : Int32 | Nil

    # The IPv6 addresses from the IPv6 CIDR block range of your subnet.
    #
    # You can't specify IPv6 addresses using this parameter if you've specified one of the following:
    # a count of IPv6 addresses, specific IPv6 prefixes, or a count of IPv6 prefixes.
    property ipv_6_addresses : Array(InstanceIpv6Address) | Nil

    # The number of IPv6 addresses to assign to a network interface. Amazon EC2 automatically selects
    # the IPv6 addresses from the subnet range.
    #
    # You can't specify a count of IPv6 addresses using this parameter if you've specified one of the
    # following: specific IPv6 addresses, specific IPv6 prefixes, or a count of IPv6 prefixes.
    #
    # If your subnet has the `AssignIpv6AddressOnCreation` attribute set, you can override that
    # setting by specifying 0 as the IPv6 address count.
    property ipv_6_address_count : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @subnet_id : String,
      @ipv_4_prefixes : Array(Ipv4PrefixSpecificationRequest) | Nil = nil,
      @ipv_4_prefix_count : Int32 | Nil = nil,
      @ipv_6_prefixes : Array(Ipv6PrefixSpecificationRequest) | Nil = nil,
      @ipv_6_prefix_count : Int32 | Nil = nil,
      @interface_type : NetworkInterfaceCreationType | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @client_token : String | Nil = nil,
      @enable_primary_ipv_6 : Bool | Nil = nil,
      @connection_tracking_specification : ConnectionTrackingSpecificationRequest | Nil = nil,
      @operator : OperatorRequest | Nil = nil,
      @description : String | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @groups : Array(String) | Nil = nil,
      @private_ip_addresses : Array(PrivateIpAddressSpecification) | Nil = nil,
      @secondary_private_ip_address_count : Int32 | Nil = nil,
      @ipv_6_addresses : Array(InstanceIpv6Address) | Nil = nil,
      @ipv_6_address_count : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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

      if value = @interface_type
        params << {"#{prefix}InterfaceType", value.to_json_object_key}
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @enable_primary_ipv_6
        params << {"#{prefix}EnablePrimaryIpv6", Core::QueryValue.bool(value)}
      end

      if value = @connection_tracking_specification
        params.concat(value.to_query_params("#{prefix}ConnectionTrackingSpecification."))
      end

      if value = @operator
        params.concat(value.to_query_params("#{prefix}Operator."))
      end

      params << {"#{prefix}SubnetId", @subnet_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      (@groups || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecurityGroupId.#{i}", item}
      end

      (@private_ip_addresses || [] of PrivateIpAddressSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateIpAddresses.#{i}."))
      end

      if value = @secondary_private_ip_address_count
        params << {"#{prefix}SecondaryPrivateIpAddressCount", value.to_s}
      end

      (@ipv_6_addresses || [] of InstanceIpv6Address).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6Addresses.#{i}."))
      end

      if value = @ipv_6_address_count
        params << {"#{prefix}Ipv6AddressCount", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_4_prefixes: node.xpath_nodes("*[local-name()='Ipv4Prefix']/*[local-name()='item']").map { |n| Ipv4PrefixSpecificationRequest.from_xml(n) },
        ipv_4_prefix_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv4PrefixCount']")),
        ipv_6_prefixes: node.xpath_nodes("*[local-name()='Ipv6Prefix']/*[local-name()='item']").map { |n| Ipv6PrefixSpecificationRequest.from_xml(n) },
        ipv_6_prefix_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6PrefixCount']")),
        interface_type: (n = node.xpath_node("*[local-name()='InterfaceType']")) ? AEC::NetworkInterfaceCreationType.from_json_object_key?(n.content) : nil,
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        enable_primary_ipv_6: Core::XMLValue.bool(node.xpath_node("*[local-name()='EnablePrimaryIpv6']")),
        connection_tracking_specification: node.xpath_node("*[local-name()='ConnectionTrackingSpecification']").try { |n| ConnectionTrackingSpecificationRequest.from_xml(n) },
        operator: node.xpath_node("*[local-name()='Operator']").try { |n| OperatorRequest.from_xml(n) },
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='privateIpAddress']")),
        groups: node.xpath_nodes("*[local-name()='SecurityGroupId']/*[local-name()='SecurityGroupId']").map { |n| n.content },
        private_ip_addresses: node.xpath_nodes("*[local-name()='privateIpAddresses']/*[local-name()='item']").map { |n| PrivateIpAddressSpecification.from_xml(n) },
        secondary_private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='secondaryPrivateIpAddressCount']")),
        ipv_6_addresses: node.xpath_nodes("*[local-name()='ipv6Addresses']/*[local-name()='item']").map { |n| InstanceIpv6Address.from_xml(n) },
        ipv_6_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='ipv6AddressCount']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @ipv_4_prefixes
        value.each(&.validate!)
      end

      if value = @ipv_6_prefixes
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @connection_tracking_specification
        value.validate!
      end

      if value = @operator
        value.validate!
      end

      if value = @private_ip_addresses
        value.each(&.validate!)
      end

      if value = @ipv_6_addresses
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipv_4_prefixes, @ipv_4_prefix_count, @ipv_6_prefixes, @ipv_6_prefix_count, @interface_type, @tag_specifications, @client_token, @enable_primary_ipv_6, @connection_tracking_specification, @operator, @subnet_id, @description, @private_ip_address, @groups, @private_ip_addresses, @secondary_private_ip_address_count, @ipv_6_addresses, @ipv_6_address_count, @dry_run)
  end
end
