private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a security group rule.
  #
  # You must specify exactly one of the following parameters, based on the rule type:
  #
  # - CidrIpv4
  #
  # - CidrIpv6
  #
  # - PrefixListId
  #
  # - ReferencedGroupId
  #
  # Amazon Web Services [canonicalizes](https://en.wikipedia.org/wiki/Canonicalization) IPv4 and
  # IPv6 CIDRs. For example, if you specify 100.68.0.18/18 for the CIDR block, Amazon Web Services
  # canonicalizes the CIDR block to 100.68.0.0/18. Any subsequent DescribeSecurityGroups and
  # DescribeSecurityGroupRules calls will return the canonicalized form of the CIDR block.
  # Additionally, if you attempt to add another rule with the non-canonical form of the CIDR (such
  # as 100.68.0.18/18) and there is already a rule for the canonicalized form of the CIDR block
  # (such as 100.68.0.0/18), the API throws an duplicate rule error.
  #
  # When you modify a rule, you cannot change the rule type. For example, if the rule uses an IPv4
  # address range, you must use `CidrIpv4` to specify a new IPv4 address range.
  class SecurityGroupRuleRequest
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

    # The IPv4 CIDR range. To specify a single IPv4 address, use the /32 prefix length.
    property cidr_ipv_4 : String | Nil

    # The IPv6 CIDR range. To specify a single IPv6 address, use the /128 prefix length.
    property cidr_ipv_6 : String | Nil

    # The ID of the prefix list.
    property prefix_list_id : String | Nil

    # The ID of the security group that is referenced in the security group rule.
    property referenced_group_id : String | Nil

    # The description of the security group rule.
    property description : String | Nil

    def initialize(
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
        ip_protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='IpProtocol']")),
        from_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='FromPort']")),
        to_port: Core::XMLValue.i32(node.xpath_node("*[local-name()='ToPort']")),
        cidr_ipv_4: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrIpv4']")),
        cidr_ipv_6: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrIpv6']")),
        prefix_list_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PrefixListId']")),
        referenced_group_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ReferencedGroupId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@ip_protocol, @from_port, @to_port, @cidr_ipv_4, @cidr_ipv_6, @prefix_list_id, @referenced_group_id, @description)
  end
end
