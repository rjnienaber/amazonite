private alias Core = Amazonite::Core

module Amazonite::EC2
  # A security group rule removed with
  # [RevokeSecurityGroupEgress](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RevokeSecurityGroupEgress.html)
  # or
  # [RevokeSecurityGroupIngress](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_RevokeSecurityGroupIngress.html).
  class RevokedSecurityGroupRule
    # A security group rule ID.
    property security_group_rule_id : String | Nil

    # A security group ID.
    property group_id : String | Nil

    # Defines if a security group rule is an outbound rule.
    property is_egress : Bool | Nil

    # The security group rule's protocol.
    property ip_protocol : String | Nil

    # The 'from' port number of the security group rule.
    property from_port : Int32 | Nil

    # The 'to' port number of the security group rule.
    property to_port : Int32 | Nil

    # The IPv4 CIDR of the traffic source.
    property cidr_ipv_4 : String | Nil

    # The IPv6 CIDR of the traffic source.
    property cidr_ipv_6 : String | Nil

    # The ID of a prefix list that's the traffic source.
    property prefix_list_id : String | Nil

    # The ID of a referenced security group.
    property referenced_group_id : String | Nil

    # A description of the revoked security group rule.
    property description : String | Nil

    def initialize(
      @security_group_rule_id : String | Nil = nil,
      @group_id : String | Nil = nil,
      @is_egress : Bool | Nil = nil,
      @ip_protocol : String | Nil = nil,
      @from_port : Int32 | Nil = nil,
      @to_port : Int32 | Nil = nil,
      @cidr_ipv_4 : String | Nil = nil,
      @cidr_ipv_6 : String | Nil = nil,
      @prefix_list_id : String | Nil = nil,
      @referenced_group_id : String | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @security_group_rule_id
        params << {"#{prefix}SecurityGroupRuleId", value}
      end

      if value = @group_id
        params << {"#{prefix}GroupId", value}
      end

      if value = @is_egress
        params << {"#{prefix}IsEgress", Core::QueryValue.bool(value)}
      end

      if value = @ip_protocol
        params << {"#{prefix}IpProtocol", value}
      end

      if value = @from_port
        params << {"#{prefix}FromPort", value.to_s}
      end

      if value = @to_port
        params << {"#{prefix}ToPort", value.to_s}
      end

      if value = @cidr_ipv_4
        params << {"#{prefix}CidrIpv4", value}
      end

      if value = @cidr_ipv_6
        params << {"#{prefix}CidrIpv6", value}
      end

      if value = @prefix_list_id
        params << {"#{prefix}PrefixListId", value}
      end

      if value = @referenced_group_id
        params << {"#{prefix}ReferencedGroupId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_rule_id: Core::XMLValue.string(node.xpath_node("*[local-name()='securityGroupRuleId']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        is_egress: Core::XMLValue.bool(node.xpath_node("*[local-name()='isEgress']")),
        ip_protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='ipProtocol']")),
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='fromPort']")),
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='toPort']")),
        cidr_ipv_4: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrIpv4']")),
        cidr_ipv_6: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrIpv6']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        referenced_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='referencedGroupId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@security_group_rule_id, @group_id, @is_egress, @ip_protocol, @from_port, @to_port, @cidr_ipv_4, @cidr_ipv_6, @prefix_list_id, @referenced_group_id, @description)
  end
end
