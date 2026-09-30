private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a security group rule.
  class SecurityGroupRule
    # The ID of the security group rule.
    property security_group_rule_id : String | Nil

    # The ID of the security group.
    property group_id : String | Nil

    # The ID of the Amazon Web Services account that owns the security group.
    property group_owner_id : String | Nil

    # Indicates whether the security group rule is an outbound rule.
    property is_egress : Bool | Nil

    # The IP protocol name (`tcp`, `udp`, `icmp`, `icmpv6`) or number (see [Protocol
    # Numbers](http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)).
    #
    # Use `-1` to specify all protocols.
    property ip_protocol : String | Nil

    # If the protocol is TCP or UDP, this is the start of the port range. If the protocol is ICMP or
    # ICMPv6, this is the ICMP type or -1 (all ICMP types).
    property from_port : Int32 | Nil

    # If the protocol is TCP or UDP, this is the end of the port range. If the protocol is ICMP or
    # ICMPv6, this is the ICMP code or -1 (all ICMP codes). If the start port is -1 (all ICMP types),
    # then the end port must be -1 (all ICMP codes).
    property to_port : Int32 | Nil

    # The IPv4 CIDR range.
    property cidr_ipv_4 : String | Nil

    # The IPv6 CIDR range.
    property cidr_ipv_6 : String | Nil

    # The ID of the prefix list.
    property prefix_list_id : String | Nil

    # Describes the security group that is referenced in the rule.
    property referenced_group_info : ReferencedSecurityGroup | Nil

    # The security group rule description.
    property description : String | Nil

    # The tags applied to the security group rule.
    property tags : Array(Tag) | Nil

    # The ARN of the security group rule.
    property security_group_rule_arn : String | Nil

    def initialize(
      @security_group_rule_id : String | Nil = nil,
      @group_id : String | Nil = nil,
      @group_owner_id : String | Nil = nil,
      @is_egress : Bool | Nil = nil,
      @ip_protocol : String | Nil = nil,
      @from_port : Int32 | Nil = nil,
      @to_port : Int32 | Nil = nil,
      @cidr_ipv_4 : String | Nil = nil,
      @cidr_ipv_6 : String | Nil = nil,
      @prefix_list_id : String | Nil = nil,
      @referenced_group_info : ReferencedSecurityGroup | Nil = nil,
      @description : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @security_group_rule_arn : String | Nil = nil,
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

      if value = @group_owner_id
        params << {"#{prefix}GroupOwnerId", value}
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

      if value = @referenced_group_info
        params.concat(value.to_query_params("#{prefix}ReferencedGroupInfo."))
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @security_group_rule_arn
        params << {"#{prefix}SecurityGroupRuleArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_rule_id: Core::XMLValue.string(node.xpath_node("*[local-name()='securityGroupRuleId']")),
        group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupId']")),
        group_owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='groupOwnerId']")),
        is_egress: Core::XMLValue.bool(node.xpath_node("*[local-name()='isEgress']")),
        ip_protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='ipProtocol']")),
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='fromPort']")),
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='toPort']")),
        cidr_ipv_4: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrIpv4']")),
        cidr_ipv_6: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrIpv6']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='prefixListId']")),
        referenced_group_info: node.xpath_node("*[local-name()='referencedGroupInfo']").try { |n| ReferencedSecurityGroup.from_xml(n) },
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        security_group_rule_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='securityGroupRuleArn']")),
      )
    end

    def validate! : Nil
      if value = @referenced_group_info
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@security_group_rule_id, @group_id, @group_owner_id, @is_egress, @ip_protocol, @from_port, @to_port, @cidr_ipv_4, @cidr_ipv_6, @prefix_list_id, @referenced_group_info, @description, @tags, @security_group_rule_arn)
  end
end
