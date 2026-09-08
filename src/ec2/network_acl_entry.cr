private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an entry in a network ACL.
  class NetworkAclEntry
    # The IPv4 network range to allow or deny, in CIDR notation.
    property cidr_block : String | Nil

    # Indicates whether the rule is an egress rule (applied to traffic leaving the subnet).
    property egress : Bool | Nil

    # ICMP protocol: The ICMP type and code.
    property icmp_type_code : IcmpTypeCode | Nil

    # The IPv6 network range to allow or deny, in CIDR notation.
    property ipv_6_cidr_block : String | Nil

    # TCP or UDP protocols: The range of ports the rule applies to.
    property port_range : PortRange | Nil

    # The protocol number. A value of "-1" means all protocols.
    property protocol : String | Nil

    # Indicates whether to allow or deny the traffic that matches the rule.
    property rule_action : RuleAction | Nil

    # The rule number for the entry. ACL entries are processed in ascending order by rule number.
    property rule_number : Int32 | Nil

    def initialize(
      @cidr_block : String | Nil = nil,
      @egress : Bool | Nil = nil,
      @icmp_type_code : IcmpTypeCode | Nil = nil,
      @ipv_6_cidr_block : String | Nil = nil,
      @port_range : PortRange | Nil = nil,
      @protocol : String | Nil = nil,
      @rule_action : RuleAction | Nil = nil,
      @rule_number : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @egress
        params << {"#{prefix}Egress", Core::QueryValue.bool(value)}
      end

      if value = @icmp_type_code
        params.concat(value.to_query_params("#{prefix}IcmpTypeCode."))
      end

      if value = @ipv_6_cidr_block
        params << {"#{prefix}Ipv6CidrBlock", value}
      end

      if value = @port_range
        params.concat(value.to_query_params("#{prefix}PortRange."))
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end

      if value = @rule_action
        params << {"#{prefix}RuleAction", value.to_json_object_key}
      end

      if value = @rule_number
        params << {"#{prefix}RuleNumber", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='cidrBlock']")),
        egress: Core::XMLValue.bool(node.xpath_node("*[local-name()='egress']")),
        icmp_type_code: node.xpath_node("*[local-name()='icmpTypeCode']").try { |n| IcmpTypeCode.from_xml(n) },
        ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='ipv6CidrBlock']")),
        port_range: node.xpath_node("*[local-name()='portRange']").try { |n| PortRange.from_xml(n) },
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")),
        rule_action: (n = node.xpath_node("*[local-name()='ruleAction']")) ? AEC::RuleAction.from_json_object_key?(n.content) : nil,
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='ruleNumber']")),
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

    def_equals_and_hash(@cidr_block, @egress, @icmp_type_code, @ipv_6_cidr_block, @port_range, @protocol, @rule_action, @rule_number)
  end
end
