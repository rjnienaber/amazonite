private alias Core = Amazonite::Core

module Amazonite::EC2
  class DisassociateSubnetCidrBlockResult
    # Information about the IPv6 CIDR block association.
    property ipv_6_cidr_block_association : SubnetIpv6CidrBlockAssociation | Nil

    # The ID of the subnet.
    property subnet_id : String | Nil

    def initialize(
      @ipv_6_cidr_block_association : SubnetIpv6CidrBlockAssociation | Nil = nil,
      @subnet_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipv_6_cidr_block_association
        params.concat(value.to_query_params("#{prefix}Ipv6CidrBlockAssociation."))
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_cidr_block_association: node.xpath_node("*[local-name()='ipv6CidrBlockAssociation']").try { |n| SubnetIpv6CidrBlockAssociation.from_xml(n) },
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_cidr_block_association
        value.validate!
      end
    end

    def_equals_and_hash(@ipv_6_cidr_block_association, @subnet_id)
  end
end
