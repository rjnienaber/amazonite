private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateVpcRequest
    # The IPv4 network range for the VPC, in CIDR notation. For example, `10.0.0.0/16`. We modify the
    # specified CIDR block to its canonical form; for example, if you specify `100.68.0.18/18`, we
    # modify it to `100.68.0.0/18`.
    property cidr_block : String | Nil

    # The ID of an IPv6 address pool from which to allocate the IPv6 CIDR block.
    property ipv_6_pool : String | Nil

    # The IPv6 CIDR block from the IPv6 address pool. You must also specify `Ipv6Pool` in the request.
    #
    # To let Amazon choose the IPv6 CIDR block for you, omit this parameter.
    property ipv_6_cidr_block : String | Nil

    # The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. For more
    # information, see [What is
    # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
    # User Guide*.
    property ipv_4_ipam_pool_id : String | Nil

    # The netmask length of the IPv4 CIDR you want to allocate to this VPC from an Amazon VPC IP
    # Address Manager (IPAM) pool. For more information about IPAM, see [What is
    # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
    # User Guide*.
    property ipv_4_netmask_length : Int32 | Nil

    # The ID of an IPv6 IPAM pool which will be used to allocate this VPC an IPv6 CIDR. IPAM is a VPC
    # feature that you can use to automate your IP address management workflows including assigning,
    # tracking, troubleshooting, and auditing IP addresses across Amazon Web Services Regions and
    # accounts throughout your Amazon Web Services Organization. For more information, see [What is
    # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
    # User Guide*.
    property ipv_6_ipam_pool_id : String | Nil

    # The netmask length of the IPv6 CIDR you want to allocate to this VPC from an Amazon VPC IP
    # Address Manager (IPAM) pool. For more information about IPAM, see [What is
    # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
    # User Guide*.
    property ipv_6_netmask_length : Int32 | Nil

    # The name of the location from which we advertise the IPV6 CIDR block. Use this parameter to
    # limit the address to this location.
    #
    # You must set `AmazonProvidedIpv6CidrBlock` to `true` to use this parameter.
    property ipv_6_cidr_block_network_border_group : String | Nil

    # Specifies the encryption control configuration to apply to the VPC during creation. VPC
    # Encryption Control enables you to enforce encryption for all data in transit within and between
    # VPCs to meet compliance requirements.
    #
    # For more information, see [Enforce VPC encryption in
    # transit](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-encryption-controls.html) in the
    # *Amazon VPC User Guide*.
    property vpc_encryption_control : VpcEncryptionControlConfiguration | Nil

    # The tags to assign to the VPC.
    property tag_specifications : Array(TagSpecification) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The tenancy options for instances launched into the VPC. For `default`, instances are launched
    # with shared tenancy by default. You can launch instances with any tenancy into a shared tenancy
    # VPC. For `dedicated`, instances are launched as dedicated tenancy instances by default. You can
    # only launch instances with a tenancy of `dedicated` or `host` into a dedicated tenancy VPC.
    #
    # **Important:** The `host` value cannot be used with this parameter. Use the `default` or
    # `dedicated` values only.
    #
    # Default: `default`
    property instance_tenancy : Tenancy | Nil

    # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot
    # specify the range of IP addresses, or the size of the CIDR block.
    property amazon_provided_ipv_6_cidr_block : Bool | Nil

    def initialize(
      @cidr_block : String | Nil = nil,
      @ipv_6_pool : String | Nil = nil,
      @ipv_6_cidr_block : String | Nil = nil,
      @ipv_4_ipam_pool_id : String | Nil = nil,
      @ipv_4_netmask_length : Int32 | Nil = nil,
      @ipv_6_ipam_pool_id : String | Nil = nil,
      @ipv_6_netmask_length : Int32 | Nil = nil,
      @ipv_6_cidr_block_network_border_group : String | Nil = nil,
      @vpc_encryption_control : VpcEncryptionControlConfiguration | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @instance_tenancy : Tenancy | Nil = nil,
      @amazon_provided_ipv_6_cidr_block : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @ipv_6_pool
        params << {"#{prefix}Ipv6Pool", value}
      end

      if value = @ipv_6_cidr_block
        params << {"#{prefix}Ipv6CidrBlock", value}
      end

      if value = @ipv_4_ipam_pool_id
        params << {"#{prefix}Ipv4IpamPoolId", value}
      end

      if value = @ipv_4_netmask_length
        params << {"#{prefix}Ipv4NetmaskLength", value.to_s}
      end

      if value = @ipv_6_ipam_pool_id
        params << {"#{prefix}Ipv6IpamPoolId", value}
      end

      if value = @ipv_6_netmask_length
        params << {"#{prefix}Ipv6NetmaskLength", value.to_s}
      end

      if value = @ipv_6_cidr_block_network_border_group
        params << {"#{prefix}Ipv6CidrBlockNetworkBorderGroup", value}
      end

      if value = @vpc_encryption_control
        params.concat(value.to_query_params("#{prefix}VpcEncryptionControl."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @instance_tenancy
        params << {"#{prefix}InstanceTenancy", value.to_json_object_key}
      end

      if value = @amazon_provided_ipv_6_cidr_block
        params << {"#{prefix}AmazonProvidedIpv6CidrBlock", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrBlock']")),
        ipv_6_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6Pool']")),
        ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6CidrBlock']")),
        ipv_4_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv4IpamPoolId']")),
        ipv_4_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv4NetmaskLength']")),
        ipv_6_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6IpamPoolId']")),
        ipv_6_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6NetmaskLength']")),
        ipv_6_cidr_block_network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6CidrBlockNetworkBorderGroup']")),
        vpc_encryption_control: node.xpath_node("*[local-name()='VpcEncryptionControl']").try { |n| VpcEncryptionControlConfiguration.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        instance_tenancy: (n = node.xpath_node("*[local-name()='instanceTenancy']")) ? AEC::Tenancy.from_json_object_key?(n.content) : nil,
        amazon_provided_ipv_6_cidr_block: Core::XMLValue.bool(node.xpath_node("*[local-name()='amazonProvidedIpv6CidrBlock']")),
      )
    end

    def validate! : Nil
      if value = @vpc_encryption_control
        value.validate!
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@cidr_block, @ipv_6_pool, @ipv_6_cidr_block, @ipv_4_ipam_pool_id, @ipv_4_netmask_length, @ipv_6_ipam_pool_id, @ipv_6_netmask_length, @ipv_6_cidr_block_network_border_group, @vpc_encryption_control, @tag_specifications, @dry_run, @instance_tenancy, @amazon_provided_ipv_6_cidr_block)
  end
end
