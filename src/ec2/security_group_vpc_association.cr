private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # A security group association with a VPC that you made with
  # [AssociateSecurityGroupVpc](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_AssociateSecurityGroupVpc.html).
  class SecurityGroupVpcAssociation
    # The association's security group ID.
    property group_id : String | Nil

    # The association's VPC ID.
    property vpc_id : String | Nil

    # The Amazon Web Services account ID of the owner of the VPC.
    property vpc_owner_id : String | Nil

    # The association's state.
    property state : SecurityGroupVpcAssociationState | Nil

    # The association's state reason.
    property state_reason : String | Nil

    # The Amazon Web Services account ID of the owner of the security group.
    property group_owner_id : String | Nil

    def initialize(
      @group_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @vpc_owner_id : String | Nil = nil,
      @state : SecurityGroupVpcAssociationState | Nil = nil,
      @state_reason : String | Nil = nil,
      @group_owner_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @vpc_owner_id
        params << {"#{prefix}VpcOwnerId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_reason
        params << {"#{prefix}StateReason", value}
      end

      if value = @group_owner_id
        params << {"#{prefix}GroupOwnerId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        vpc_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcOwnerId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::SecurityGroupVpcAssociationState.from_json_object_key?(n.content) : nil,
        state_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='stateReason']")),
        group_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupOwnerId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@group_id, @vpc_id, @vpc_owner_id, @state, @state_reason, @group_owner_id)
  end
end
