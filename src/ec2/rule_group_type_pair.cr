private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the type of a stateful rule group.
  class RuleGroupTypePair
    # The ARN of the rule group.
    property rule_group_arn : String | Nil

    # The rule group type. The possible values are `Domain List` and `Suricata`.
    property rule_group_type : String | Nil

    def initialize(
      @rule_group_arn : String | Nil = nil,
      @rule_group_type : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @rule_group_arn
        params << {"#{prefix}RuleGroupArn", value}
      end

      if value = @rule_group_type
        params << {"#{prefix}RuleGroupType", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rule_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ruleGroupArn']")),
        rule_group_type: Core::XMLValue.string(node.xpath_node("*[local-name()='ruleGroupType']")),
      )
    end

    def validate! : Nil
      if value = @rule_group_arn
        raise Core::ValidationError.new("RuleGroupArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleGroupArn length must be <= 1283") if value.size > 1283
      end
    end

    def_equals_and_hash(@rule_group_arn, @rule_group_type)
  end
end
