private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNetworkAclEntryRequest
    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the network ACL.
    property network_acl_id : String

    # The rule number for the entry (for example, 100). ACL entries are processed in ascending order
    # by rule number.
    #
    # Constraints: Positive integer from 1 to 32766. The range 32767 to 65535 is reserved for internal
    # use.
    property rule_number : Int32

    # The protocol number. A value of "-1" means all protocols. If you specify "-1" or a protocol
    # number other than "6" (TCP), "17" (UDP), or "1" (ICMP), traffic on all ports is allowed,
    # regardless of any ports or ICMP types or codes that you specify. If you specify protocol "58"
    # (ICMPv6) and specify an IPv4 CIDR block, traffic for all ICMP types and codes allowed,
    # regardless of any that you specify. If you specify protocol "58" (ICMPv6) and specify an IPv6
    # CIDR block, you must specify an ICMP type and code.
    property protocol : String

    # Indicates whether to allow or deny the traffic that matches the rule.
    property rule_action : RuleAction

    # Indicates whether this is an egress rule (rule is applied to traffic leaving the subnet).
    property egress : Bool

    # The IPv4 network range to allow or deny, in CIDR notation (for example `172.16.0.0/24`). We
    # modify the specified CIDR block to its canonical form; for example, if you specify
    # `100.68.0.18/18`, we modify it to `100.68.0.0/18`.
    property cidr_block : String | Nil

    # The IPv6 network range to allow or deny, in CIDR notation (for example
    # `2001:db8:1234:1a00::/64`).
    property ipv_6_cidr_block : String | Nil

    # ICMP protocol: The ICMP or ICMPv6 type and code. Required if specifying protocol 1 (ICMP) or
    # protocol 58 (ICMPv6) with an IPv6 CIDR block.
    property icmp_type_code : IcmpTypeCode | Nil

    # TCP or UDP protocols: The range of ports the rule applies to. Required if specifying protocol 6
    # (TCP) or 17 (UDP).
    property port_range : PortRange | Nil

    def initialize(
      @network_acl_id : String,
      @rule_number : Int32,
      @protocol : String,
      @rule_action : RuleAction,
      @egress : Bool,
      @dry_run : Bool | Nil = nil,
      @cidr_block : String | Nil = nil,
      @ipv_6_cidr_block : String | Nil = nil,
      @icmp_type_code : IcmpTypeCode | Nil = nil,
      @port_range : PortRange | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}NetworkAclId", @network_acl_id}

      params << {"#{prefix}RuleNumber", @rule_number.to_s}

      params << {"#{prefix}Protocol", @protocol}

      params << {"#{prefix}RuleAction", @rule_action.to_json_object_key}

      params << {"#{prefix}Egress", Core::QueryValue.bool(@egress)}

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @ipv_6_cidr_block
        params << {"#{prefix}Ipv6CidrBlock", value}
      end

      if value = @icmp_type_code
        params.concat(value.to_query_params("#{prefix}Icmp."))
      end

      if value = @port_range
        params.concat(value.to_query_params("#{prefix}PortRange."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
        network_acl_id: Core::XMLValue.string(node.xpath_node("*[local-name()='networkAclId']")).not_nil!,
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='ruleNumber']")).not_nil!,
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")).not_nil!,
        rule_action: ((n = node.xpath_node("*[local-name()='ruleAction']")) ? AEC::RuleAction.from_json_object_key?(n.content) : nil).not_nil!,
        egress: Core::XMLValue.bool(node.xpath_node("*[local-name()='egress']")).not_nil!,
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrBlock']")),
        ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6CidrBlock']")),
        icmp_type_code: node.xpath_node("*[local-name()='Icmp']").try { |n| IcmpTypeCode.from_xml(n) },
        port_range: node.xpath_node("*[local-name()='portRange']").try { |n| PortRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @icmp_type_code
        value.validate!
      end

      if value = @port_range
        value.validate!
      end
    end

    def_equals_and_hash(@dry_run, @network_acl_id, @rule_number, @protocol, @rule_action, @egress, @cidr_block, @ipv_6_cidr_block, @icmp_type_code, @port_range)
  end
end
