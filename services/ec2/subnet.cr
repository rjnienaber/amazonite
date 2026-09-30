private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a subnet.
  class Subnet
    # The AZ ID of the subnet.
    property availability_zone_id : String | Nil

    # Indicates the device position for local network interfaces in this subnet. For example, `1`
    # indicates local network interfaces in this subnet are the secondary network interface (eth1).
    property enable_lni_at_device_index : Int32 | Nil

    # Indicates whether a network interface created in this subnet (including a network interface
    # created by RunInstances) receives a customer-owned IPv4 address.
    property map_customer_owned_ip_on_launch : Bool | Nil

    # The customer-owned IPv4 address pool associated with the subnet.
    property customer_owned_ipv_4_pool : String | Nil

    # The ID of the Amazon Web Services account that owns the subnet.
    property owner_id : String | Nil

    # Indicates whether a network interface created in this subnet (including a network interface
    # created by RunInstances) receives an IPv6 address.
    property assign_ipv_6_address_on_creation : Bool | Nil

    # Information about the IPv6 CIDR blocks associated with the subnet.
    property ipv_6_cidr_block_association_set : Array(SubnetIpv6CidrBlockAssociation) | Nil

    # Any tags assigned to the subnet.
    property tags : Array(Tag) | Nil

    # The Amazon Resource Name (ARN) of the subnet.
    property subnet_arn : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost.
    property outpost_arn : String | Nil

    # Indicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should
    # return synthetic IPv6 addresses for IPv4-only destinations.
    property enable_dns_64 : Bool | Nil

    # Indicates whether this is an IPv6 only subnet.
    property ipv_6_native : Bool | Nil

    # The type of hostnames to assign to instances in the subnet at launch. An instance hostname is
    # based on the IPv4 address or ID of the instance.
    property private_dns_name_options_on_launch : PrivateDnsNameOptionsOnLaunch | Nil

    # The state of VPC Block Public Access (BPA).
    property block_public_access_states : BlockPublicAccessStates | Nil

    # Indicates if this is a subnet used with Amazon Elastic VMware Service (EVS). Possible values are
    # `Elastic VMware Service` or no value. For more information about Amazon EVS, see [ *Amazon
    # Elastic VMware Service API Reference*
    # ](https://docs.aws.amazon.com/evs/latest/APIReference/Welcome.html).
    property type : String | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    # The current state of the subnet.
    #
    # - `failed`: The underlying infrastructure to support the subnet failed to provision as expected.
    #
    # - `failed-insufficient-capacity`: The underlying infrastructure to support the subnet failed to
    # provision due to a shortage of EC2 instance capacity.
    property state : SubnetState | Nil

    # The ID of the VPC the subnet is in.
    property vpc_id : String | Nil

    # The IPv4 CIDR block assigned to the subnet.
    property cidr_block : String | Nil

    # The number of unused private IPv4 addresses in the subnet. The IPv4 addresses for any stopped
    # instances are considered unavailable.
    property available_ip_address_count : Int32 | Nil

    # The Availability Zone of the subnet.
    property availability_zone : String | Nil

    # Indicates whether this is the default subnet for the Availability Zone.
    property default_for_az : Bool | Nil

    # Indicates whether instances launched in this subnet receive a public IPv4 address.
    #
    # Amazon Web Services charges for all public IPv4 addresses, including public IPv4 addresses
    # associated with running instances and Elastic IP addresses. For more information, see the
    # *Public IPv4 Address* tab on the [Amazon VPC pricing page](http://aws.amazon.com/vpc/pricing/).
    property map_public_ip_on_launch : Bool | Nil

    def initialize(
      @availability_zone_id : String | Nil = nil,
      @enable_lni_at_device_index : Int32 | Nil = nil,
      @map_customer_owned_ip_on_launch : Bool | Nil = nil,
      @customer_owned_ipv_4_pool : String | Nil = nil,
      @owner_id : String | Nil = nil,
      @assign_ipv_6_address_on_creation : Bool | Nil = nil,
      @ipv_6_cidr_block_association_set : Array(SubnetIpv6CidrBlockAssociation) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @subnet_arn : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @enable_dns_64 : Bool | Nil = nil,
      @ipv_6_native : Bool | Nil = nil,
      @private_dns_name_options_on_launch : PrivateDnsNameOptionsOnLaunch | Nil = nil,
      @block_public_access_states : BlockPublicAccessStates | Nil = nil,
      @type : String | Nil = nil,
      @subnet_id : String | Nil = nil,
      @state : SubnetState | Nil = nil,
      @vpc_id : String | Nil = nil,
      @cidr_block : String | Nil = nil,
      @available_ip_address_count : Int32 | Nil = nil,
      @availability_zone : String | Nil = nil,
      @default_for_az : Bool | Nil = nil,
      @map_public_ip_on_launch : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @enable_lni_at_device_index
        params << {"#{prefix}EnableLniAtDeviceIndex", value.to_s}
      end

      if value = @map_customer_owned_ip_on_launch
        params << {"#{prefix}MapCustomerOwnedIpOnLaunch", Core::QueryValue.bool(value)}
      end

      if value = @customer_owned_ipv_4_pool
        params << {"#{prefix}CustomerOwnedIpv4Pool", value}
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @assign_ipv_6_address_on_creation
        params << {"#{prefix}AssignIpv6AddressOnCreation", Core::QueryValue.bool(value)}
      end

      (@ipv_6_cidr_block_association_set || [] of SubnetIpv6CidrBlockAssociation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6CidrBlockAssociationSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @subnet_arn
        params << {"#{prefix}SubnetArn", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      if value = @enable_dns_64
        params << {"#{prefix}EnableDns64", Core::QueryValue.bool(value)}
      end

      if value = @ipv_6_native
        params << {"#{prefix}Ipv6Native", Core::QueryValue.bool(value)}
      end

      if value = @private_dns_name_options_on_launch
        params.concat(value.to_query_params("#{prefix}PrivateDnsNameOptionsOnLaunch."))
      end

      if value = @block_public_access_states
        params.concat(value.to_query_params("#{prefix}BlockPublicAccessStates."))
      end

      if value = @type
        params << {"#{prefix}Type", value}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @available_ip_address_count
        params << {"#{prefix}AvailableIpAddressCount", value.to_s}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @default_for_az
        params << {"#{prefix}DefaultForAz", Core::QueryValue.bool(value)}
      end

      if value = @map_public_ip_on_launch
        params << {"#{prefix}MapPublicIpOnLaunch", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZoneId']")),
        enable_lni_at_device_index: Core::XMLValue.i32(node.xpath_node("*[local-name()='enableLniAtDeviceIndex']")),
        map_customer_owned_ip_on_launch: Core::XMLValue.bool(node.xpath_node("*[local-name()='mapCustomerOwnedIpOnLaunch']")),
        customer_owned_ipv_4_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='customerOwnedIpv4Pool']")),
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        assign_ipv_6_address_on_creation: Core::XMLValue.bool(node.xpath_node("*[local-name()='assignIpv6AddressOnCreation']")),
        ipv_6_cidr_block_association_set: node.xpath_nodes("*[local-name()='ipv6CidrBlockAssociationSet']/*[local-name()='item']").map { |n| SubnetIpv6CidrBlockAssociation.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        subnet_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetArn']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='outpostArn']")),
        enable_dns_64: Core::XMLValue.bool(node.xpath_node("*[local-name()='enableDns64']")),
        ipv_6_native: Core::XMLValue.bool(node.xpath_node("*[local-name()='ipv6Native']")),
        private_dns_name_options_on_launch: node.xpath_node("*[local-name()='privateDnsNameOptionsOnLaunch']").try { |n| PrivateDnsNameOptionsOnLaunch.from_xml(n) },
        block_public_access_states: node.xpath_node("*[local-name()='blockPublicAccessStates']").try { |n| BlockPublicAccessStates.from_xml(n) },
        type: Core::XMLValue.string(node.xpath_node("*[local-name()='type']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SubnetState.from_json_object_key?(n.content) : nil,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrBlock']")),
        available_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='availableIpAddressCount']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='availabilityZone']")),
        default_for_az: Core::XMLValue.bool(node.xpath_node("*[local-name()='defaultForAz']")),
        map_public_ip_on_launch: Core::XMLValue.bool(node.xpath_node("*[local-name()='mapPublicIpOnLaunch']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_cidr_block_association_set
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @private_dns_name_options_on_launch
        value.validate!
      end

      if value = @block_public_access_states
        value.validate!
      end
    end

    def_equals_and_hash(@availability_zone_id, @enable_lni_at_device_index, @map_customer_owned_ip_on_launch, @customer_owned_ipv_4_pool, @owner_id, @assign_ipv_6_address_on_creation, @ipv_6_cidr_block_association_set, @tags, @subnet_arn, @outpost_arn, @enable_dns_64, @ipv_6_native, @private_dns_name_options_on_launch, @block_public_access_states, @type, @subnet_id, @state, @vpc_id, @cidr_block, @available_ip_address_count, @availability_zone, @default_for_az, @map_public_ip_on_launch)
  end
end
