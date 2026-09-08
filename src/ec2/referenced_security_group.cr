private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the security group that is referenced in the security group rule.
  class ReferencedSecurityGroup
    # The ID of the security group.
    property group_id : String | Nil

    # The status of a VPC peering connection, if applicable.
    property peering_status : String | Nil

    # The Amazon Web Services account ID.
    property user_id : String | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    # The ID of the VPC peering connection (if applicable).
    property vpc_peering_connection_id : String | Nil

    def initialize(
      @group_id : String | Nil = nil,
      @peering_status : String | Nil = nil,
      @user_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @vpc_peering_connection_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @peering_status
        params << {"#{prefix}PeeringStatus", value}
      end

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @vpc_peering_connection_id
        params << {"#{prefix}VpcPeeringConnectionId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        peering_status: Core::XMLValue.string(node.xpath_node("*[local-name()='peeringStatus']")),
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='userId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        vpc_peering_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcPeeringConnectionId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_id, @peering_status, @user_id, @vpc_id, @vpc_peering_connection_id)
  end
end
