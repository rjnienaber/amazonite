private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a security group and Amazon Web Services account ID pair.
  class UserIdGroupPair
    # A description for the security group rule that references this user ID group pair.
    #
    # Constraints: Up to 255 characters in length. Allowed characters are a-z, A-Z, 0-9, spaces, and
    # ._-:/()#,@[]+=;{}!$*
    property description : String | Nil

    # The ID of an Amazon Web Services account.
    #
    # For a referenced security group in another VPC, the account ID of the referenced security group
    # is returned in the response. If the referenced security group is deleted, this value is not
    # returned.
    property user_id : String | Nil

    # [Default VPC] The name of the security group. For a security group in a nondefault VPC, use the
    # security group ID.
    #
    # For a referenced security group in another VPC, this value is not returned if the referenced
    # security group is deleted.
    property group_name : String | Nil

    # The ID of the security group.
    property group_id : String | Nil

    # The ID of the VPC for the referenced security group, if applicable.
    property vpc_id : String | Nil

    # The ID of the VPC peering connection, if applicable.
    property vpc_peering_connection_id : String | Nil

    # The status of a VPC peering connection, if applicable.
    property peering_status : String | Nil

    def initialize(
      @description : String | Nil = nil,
      @user_id : String | Nil = nil,
      @group_name : String | Nil = nil,
      @group_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @vpc_peering_connection_id : String | Nil = nil,
      @peering_status : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      if value = @user_id
        params << {"#{prefix}UserId", value}
      end

      if value = @group_name
        params << {"#{prefix}GroupName", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @vpc_peering_connection_id
        params << {"#{prefix}VpcPeeringConnectionId", value}
      end

      if value = @peering_status
        params << {"#{prefix}PeeringStatus", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        user_id: Core::XMLValue.string(node.xpath_node("*[local-name()='userId']")),
        group_name: Core::XMLValue.string(node.xpath_node("*[local-name()='groupName']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        vpc_peering_connection_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcPeeringConnectionId']")),
        peering_status: Core::XMLValue.string(node.xpath_node("*[local-name()='peeringStatus']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@description, @user_id, @group_name, @group_id, @vpc_id, @vpc_peering_connection_id, @peering_status)
  end
end
