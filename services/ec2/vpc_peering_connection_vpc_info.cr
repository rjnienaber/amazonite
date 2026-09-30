private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPC in a VPC peering connection.
  class VpcPeeringConnectionVpcInfo
    # The IPv4 CIDR block for the VPC.
    property cidr_block : String | Nil

    # The IPv6 CIDR block for the VPC.
    property ipv_6_cidr_block_set : Array(Ipv6CidrBlock) | Nil

    # Information about the IPv4 CIDR blocks for the VPC.
    property cidr_block_set : Array(CidrBlock) | Nil

    # The ID of the Amazon Web Services account that owns the VPC.
    property owner_id : String | Nil

    # Information about the VPC peering connection options for the accepter or requester VPC.
    property peering_options : VpcPeeringConnectionOptionsDescription | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    # The Region in which the VPC is located.
    property region : String | Nil

    def initialize(
      @cidr_block : String | Nil = nil,
      @ipv_6_cidr_block_set : Array(Ipv6CidrBlock) | Nil = nil,
      @cidr_block_set : Array(CidrBlock) | Nil = nil,
      @owner_id : String | Nil = nil,
      @peering_options : VpcPeeringConnectionOptionsDescription | Nil = nil,
      @vpc_id : String | Nil = nil,
      @region : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      (@ipv_6_cidr_block_set || [] of Ipv6CidrBlock).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6CidrBlockSet.#{i}."))
      end

      (@cidr_block_set || [] of CidrBlock).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CidrBlockSet.#{i}."))
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @peering_options
        params.concat(value.to_query_params("#{prefix}PeeringOptions."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @region
        params << {"#{prefix}Region", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrBlock']")),
        ipv_6_cidr_block_set: node.xpath_nodes("*[local-name()='ipv6CidrBlockSet']/*[local-name()='item']").map { |n| Ipv6CidrBlock.from_xml(n) },
        cidr_block_set: node.xpath_nodes("*[local-name()='cidrBlockSet']/*[local-name()='item']").map { |n| CidrBlock.from_xml(n) },
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        peering_options: node.xpath_node("*[local-name()='peeringOptions']").try { |n| VpcPeeringConnectionOptionsDescription.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        region: Core::XMLValue.string(node.xpath_node("*[local-name()='region']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_cidr_block_set
        value.each(&.validate!)
      end

      if value = @cidr_block_set
        value.each(&.validate!)
      end

      if value = @peering_options
        value.validate!
      end
    end

    def_equals_and_hash(@cidr_block, @ipv_6_cidr_block_set, @cidr_block_set, @owner_id, @peering_options, @vpc_id, @region)
  end
end
