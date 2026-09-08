private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv4 CIDR block associated with a VPC.
  class VpcCidrBlockAssociation
    # The association ID for the IPv4 CIDR block.
    property association_id : String | Nil

    # The IPv4 CIDR block.
    property cidr_block : String | Nil

    # Information about the state of the CIDR block.
    property cidr_block_state : VpcCidrBlockState | Nil

    def initialize(
      @association_id : String | Nil = nil,
      @cidr_block : String | Nil = nil,
      @cidr_block_state : VpcCidrBlockState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @association_id
        params << {"#{prefix}AssociationId", value}
      end

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @cidr_block_state
        params.concat(value.to_query_params("#{prefix}CidrBlockState."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        association_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationId']")),
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrBlock']")),
        cidr_block_state: node.xpath_node("*[local-name()='cidrBlockState']").try { |n| VpcCidrBlockState.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @cidr_block_state
        value.validate!
      end
    end

    def_equals_and_hash(@association_id, @cidr_block, @cidr_block_state)
  end
end
