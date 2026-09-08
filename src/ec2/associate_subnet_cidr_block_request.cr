private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateSubnetCidrBlockRequest
    # An IPv6 IPAM pool ID.
    property ipv_6_ipam_pool_id : String | Nil

    # An IPv6 netmask length.
    property ipv_6_netmask_length : Int32 | Nil

    # The ID of your subnet.
    property subnet_id : String

    # The IPv6 CIDR block for your subnet.
    property ipv_6_cidr_block : String | Nil

    def initialize(
      @subnet_id : String,
      @ipv_6_ipam_pool_id : String | Nil = nil,
      @ipv_6_netmask_length : Int32 | Nil = nil,
      @ipv_6_cidr_block : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_ipam_pool_id
        params << {"#{prefix}Ipv6IpamPoolId", value}
      end

      if value = @ipv_6_netmask_length
        params << {"#{prefix}Ipv6NetmaskLength", value.to_s}
      end

      params << {"#{prefix}SubnetId", @subnet_id}

      if value = @ipv_6_cidr_block
        params << {"#{prefix}Ipv6CidrBlock", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6IpamPoolId']")),
        ipv_6_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6NetmaskLength']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")).not_nil!,
        ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6CidrBlock']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ipv_6_ipam_pool_id, @ipv_6_netmask_length, @subnet_id, @ipv_6_cidr_block)
  end
end
