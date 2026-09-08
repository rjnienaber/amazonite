private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateVpcCidrBlockResult
    # Information about the IPv6 CIDR block association.
    property ipv_6_cidr_block_association : VpcIpv6CidrBlockAssociation | Nil

    # Information about the IPv4 CIDR block association.
    property cidr_block_association : VpcCidrBlockAssociation | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    def initialize(
      @ipv_6_cidr_block_association : VpcIpv6CidrBlockAssociation | Nil = nil,
      @cidr_block_association : VpcCidrBlockAssociation | Nil = nil,
      @vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_cidr_block_association
        params.concat(value.to_query_params("#{prefix}Ipv6CidrBlockAssociation."))
      end

      if value = @cidr_block_association
        params.concat(value.to_query_params("#{prefix}CidrBlockAssociation."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_cidr_block_association: node.xpath_node("*[local-name()='ipv6CidrBlockAssociation']").try { |n| VpcIpv6CidrBlockAssociation.from_xml(n) },
        cidr_block_association: node.xpath_node("*[local-name()='cidrBlockAssociation']").try { |n| VpcCidrBlockAssociation.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_cidr_block_association
        value.validate!
      end

      if value = @cidr_block_association
        value.validate!
      end
    end

    def_equals_and_hash(@ipv_6_cidr_block_association, @cidr_block_association, @vpc_id)
  end
end
