private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a network access control (ACL) rule.
  class AnalysisAclRule
    # The IPv4 address range, in CIDR notation.
    property cidr : String | Nil

    # Indicates whether the rule is an outbound rule.
    property egress : Bool | Nil

    # The range of ports.
    property port_range : PortRange | Nil

    # The protocol.
    property protocol : String | Nil

    # Indicates whether to allow or deny traffic that matches the rule.
    property rule_action : String | Nil

    # The rule number.
    property rule_number : Int32 | Nil

    def initialize(
      @cidr : String | Nil = nil,
      @egress : Bool | Nil = nil,
      @port_range : PortRange | Nil = nil,
      @protocol : String | Nil = nil,
      @rule_action : String | Nil = nil,
      @rule_number : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @cidr
        params << {"#{prefix}Cidr", value}
      end

      if value = @egress
        params << {"#{prefix}Egress", Core::QueryValue.bool(value)}
      end

      if value = @port_range
        params.concat(value.to_query_params("#{prefix}PortRange."))
      end

      if value = @protocol
        params << {"#{prefix}Protocol", value}
      end

      if value = @rule_action
        params << {"#{prefix}RuleAction", value}
      end

      if value = @rule_number
        params << {"#{prefix}RuleNumber", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='cidr']")),
        egress: Core::XMLValue.bool(node.xpath_node("*[local-name()='egress']")),
        port_range: node.xpath_node("*[local-name()='portRange']").try { |n| PortRange.from_xml(n) },
        protocol: Core::XMLValue.string(node.xpath_node("*[local-name()='protocol']")),
        rule_action: Core::XMLValue.string(node.xpath_node("*[local-name()='ruleAction']")),
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='ruleNumber']")),
      )
    end

    def validate! : Nil
      if value = @port_range
        value.validate!
      end
    end

    def_equals_and_hash(@cidr, @egress, @port_range, @protocol, @rule_action, @rule_number)
  end
end
