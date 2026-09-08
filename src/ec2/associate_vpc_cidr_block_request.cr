private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateVpcCidrBlockRequest
    # An IPv4 CIDR block to associate with the VPC.
    property cidr_block : String | Nil

    # The name of the location from which we advertise the IPV6 CIDR block. Use this parameter to
    # limit the CIDR block to this location.
    #
    # You must set `AmazonProvidedIpv6CidrBlock` to `true` to use this parameter.
    #
    # You can have one IPv6 CIDR block association per network border group.
    property ipv_6_cidr_block_network_border_group : String | Nil

    # The ID of an IPv6 address pool from which to allocate the IPv6 CIDR block.
    property ipv_6_pool : String | Nil

    # An IPv6 CIDR block from the IPv6 address pool. You must also specify `Ipv6Pool` in the request.
    #
    # To let Amazon choose the IPv6 CIDR block for you, omit this parameter.
    property ipv_6_cidr_block : String | Nil

    # Associate a CIDR allocated from an IPv4 IPAM pool to a VPC. For more information about Amazon
    # VPC IP Address Manager (IPAM), see [What is
    # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
    # User Guide*.
    property ipv_4_ipam_pool_id : String | Nil

    # The netmask length of the IPv4 CIDR you would like to associate from an Amazon VPC IP Address
    # Manager (IPAM) pool. For more information about IPAM, see [What is
    # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
    # User Guide*.
    property ipv_4_netmask_length : Int32 | Nil

    # Associates a CIDR allocated from an IPv6 IPAM pool to a VPC. For more information about Amazon
    # VPC IP Address Manager (IPAM), see [What is
    # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
    # User Guide*.
    property ipv_6_ipam_pool_id : String | Nil

    # The netmask length of the IPv6 CIDR you would like to associate from an Amazon VPC IP Address
    # Manager (IPAM) pool. For more information about IPAM, see [What is
    # IPAM?](https://docs.aws.amazon.com/vpc/latest/ipam/what-is-it-ipam.html) in the *Amazon VPC IPAM
    # User Guide*.
    property ipv_6_netmask_length : Int32 | Nil

    # The ID of the VPC.
    property vpc_id : String

    # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot
    # specify the range of IPv6 addresses or the size of the CIDR block.
    property amazon_provided_ipv_6_cidr_block : Bool | Nil

    def initialize(
      @vpc_id : String,
      @cidr_block : String | Nil = nil,
      @ipv_6_cidr_block_network_border_group : String | Nil = nil,
      @ipv_6_pool : String | Nil = nil,
      @ipv_6_cidr_block : String | Nil = nil,
      @ipv_4_ipam_pool_id : String | Nil = nil,
      @ipv_4_netmask_length : Int32 | Nil = nil,
      @ipv_6_ipam_pool_id : String | Nil = nil,
      @ipv_6_netmask_length : Int32 | Nil = nil,
      @amazon_provided_ipv_6_cidr_block : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @ipv_6_cidr_block_network_border_group
        params << {"#{prefix}Ipv6CidrBlockNetworkBorderGroup", value}
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

      params << {"#{prefix}VpcId", @vpc_id}

      if value = @amazon_provided_ipv_6_cidr_block
        params << {"#{prefix}AmazonProvidedIpv6CidrBlock", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrBlock']")),
        ipv_6_cidr_block_network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6CidrBlockNetworkBorderGroup']")),
        ipv_6_pool: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6Pool']")),
        ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6CidrBlock']")),
        ipv_4_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv4IpamPoolId']")),
        ipv_4_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv4NetmaskLength']")),
        ipv_6_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6IpamPoolId']")),
        ipv_6_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6NetmaskLength']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")).not_nil!,
        amazon_provided_ipv_6_cidr_block: Core::XMLValue.bool(node.xpath_node("*[local-name()='amazonProvidedIpv6CidrBlock']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@cidr_block, @ipv_6_cidr_block_network_border_group, @ipv_6_pool, @ipv_6_cidr_block, @ipv_4_ipam_pool_id, @ipv_4_netmask_length, @ipv_6_ipam_pool_id, @ipv_6_netmask_length, @vpc_id, @amazon_provided_ipv_6_cidr_block)
  end
end
