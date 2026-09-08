private alias Core = Amazonite::Core

module Amazonite::EC2
  class AuthorizeSecurityGroupEgressResult
    # Returns `true` if the request succeeds; otherwise, returns an error.
    property return : Bool | Nil

    # Information about the outbound (egress) security group rules that were added.
    property security_group_rules : Array(SecurityGroupRule) | Nil

    def initialize(
      @return : Bool | Nil = nil,
      @security_group_rules : Array(SecurityGroupRule) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @return
        params << {"#{prefix}Return", Core::QueryValue.bool(value)}
      end

      (@security_group_rules || [] of SecurityGroupRule).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SecurityGroupRuleSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        return: Core::XMLValue.bool(node.xpath_node("*[local-name()='return']")),
        security_group_rules: node.xpath_nodes("*[local-name()='securityGroupRuleSet']/*[local-name()='item']").map { |n| SecurityGroupRule.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @security_group_rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@return, @security_group_rules)
  end
end
