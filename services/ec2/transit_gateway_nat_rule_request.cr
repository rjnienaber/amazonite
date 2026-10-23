private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a NAT gateway rule to apply to a transit gateway attachment. A NAT gateway rule
  # translates source addresses in the `MatchSourceCidr` range to the corresponding addresses in the
  # `NatCidr` range.
  class TransitGatewayNatRuleRequest
    # The rule number. Valid values are 1 to 32766. Each rule number must be unique within the
    # request.
    property rule_number : Int32 | Nil

    # The IPv4 CIDR block of the source addresses to translate. The CIDR block can't overlap the
    # multicast range (`224.0.0.0/4`) or the link-local range (`169.254.0.0/16`).
    property match_source_cidr : String | Nil

    # The IPv4 CIDR block to translate the source addresses to. The CIDR block must be in a private
    # (RFC 1918) or shared address space (RFC 6598) range, and must have the same prefix length as
    # `MatchSourceCidr`. The CIDR blocks in the rules for an attachment can't overlap each other.
    property nat_cidr : String | Nil

    def initialize(
      @rule_number : Int32 | Nil = nil,
      @match_source_cidr : String | Nil = nil,
      @nat_cidr : String | Nil = nil,
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rule_number: Core::XMLValue.i32(node.xpath_node("*[local-name()='RuleNumber']")),
        match_source_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='MatchSourceCidr']")),
        nat_cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='NatCidr']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rule_number, @match_source_cidr, @nat_cidr)
  end
end
