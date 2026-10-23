private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a NAT gateway rule for a transit gateway attachment, including the
  # rule number, the source CIDR block, the translated CIDR block, and the state of the rule.
  class TransitGatewayNatRule
    # The rule number.
    property rule_number : Int32 | Nil

    # The IPv4 CIDR block of the source addresses to translate.
    property match_source_cidr : String | Nil

    # The IPv4 CIDR block that the transit gateway translates the source addresses to.
    property nat_cidr : String | Nil

    # The state of the NAT gateway rule. The possible values are:
    #
    # - `pending` - The transit gateway is applying a change to the rule.
    #
    # - `activated` - The rule is in effect because NAT gateway support is enabled for the attachment.
    #
    # - `deactivated` - The rule isn't in effect because NAT gateway support is disabled for the
    # attachment.
    property state : TransitGatewayNatRuleState | Nil

    def initialize(
      @rule_number : Int32 | Nil = nil,
      @match_source_cidr : String | Nil = nil,
      @nat_cidr : String | Nil = nil,
      @state : TransitGatewayNatRuleState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @rule_number
        params << {"#{prefix}RuleNumber", value.to_s}
      end

      if value = @match_source_cidr
        params << {"#{prefix}MatchSourceCidr", value}
      end

      if value = @nat_cidr
        params << {"#{prefix}NatCidr", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='ruleNumber']")),
        match_source_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='matchSourceCidr']")),
        nat_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='natCidr']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::TransitGatewayNatRuleState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rule_number, @match_source_cidr, @nat_cidr, @state)
  end
end
