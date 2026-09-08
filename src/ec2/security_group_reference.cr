private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPC with a security group that references your security group.
  class SecurityGroupReference
    # The ID of your security group.
    property group_id : String | Nil

    # The ID of the VPC with the referencing security group.
    property referencing_vpc_id : String | Nil

    # The ID of the VPC peering connection (if applicable). For more information about security group
    # referencing for peering connections, see [Update your security groups to reference peer security
    # groups](https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-security-groups.html) in the
    # *VPC Peering Guide*.
    property vpc_peering_connection_id : String | Nil

    # The ID of the transit gateway (if applicable).
    property transit_gateway_id : String | Nil

    def initialize(
      @group_id : String | Nil = nil,
      @referencing_vpc_id : String | Nil = nil,
      @vpc_peering_connection_id : String | Nil = nil,
      @transit_gateway_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @referencing_vpc_id
        params << {"#{prefix}ReferencingVpcId", value}
      end

      if value = @vpc_peering_connection_id
        params << {"#{prefix}VpcPeeringConnectionId", value}
      end

      if value = @transit_gateway_id
        params << {"#{prefix}TransitGatewayId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        referencing_vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='referencingVpcId']")),
        vpc_peering_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcPeeringConnectionId']")),
        transit_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='transitGatewayId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_id, @referencing_vpc_id, @vpc_peering_connection_id, @transit_gateway_id)
  end
end
