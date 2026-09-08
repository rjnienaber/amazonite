private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the rule options for a stateful rule group.
  class RuleGroupRuleOptionsPair
    # The ARN of the rule group.
    property rule_group_arn : String | Nil

    # The rule options.
    property rule_options : Array(RuleOption) | Nil

    def initialize(
      @rule_group_arn : String | Nil = nil,
      @rule_options : Array(RuleOption) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @rule_group_arn
        params << {"#{prefix}RuleGroupArn", value}
      end

      (@rule_options || [] of RuleOption).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}RuleOptionSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        rule_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='ruleGroupArn']")),
        rule_options: node.xpath_nodes("*[local-name()='ruleOptionSet']/*[local-name()='item']").map { |n| RuleOption.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @rule_group_arn
        raise Core::ValidationError.new("RuleGroupArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleGroupArn length must be <= 1283") if value.size > 1283
      end

      if value = @rule_options
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rule_group_arn, @rule_options)
  end
end
