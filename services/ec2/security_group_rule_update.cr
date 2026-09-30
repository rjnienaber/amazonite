private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an update to a security group rule.
  class SecurityGroupRuleUpdate
    # The ID of the security group rule.
    property security_group_rule_id : String

    # Information about the security group rule.
    property security_group_rule : SecurityGroupRuleRequest | Nil

    def initialize(
      @security_group_rule_id : String,
      @security_group_rule : SecurityGroupRuleRequest | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}SecurityGroupRuleId", @security_group_rule_id}

      if value = @security_group_rule
        params.concat(value.to_query_params("#{prefix}SecurityGroupRule."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        security_group_rule_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SecurityGroupRuleId']")).not_nil!,
        security_group_rule: node.xpath_node("*[local-name()='SecurityGroupRule']").try { |n| SecurityGroupRuleRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @security_group_rule
        value.validate!
      end
    end

    def_equals_and_hash(@security_group_rule_id, @security_group_rule)
  end
end
