module Amazonite::CloudWatchV1
  class DeleteInsightRulesInput
    include JSON::Serializable

    # An array of the rule names to delete. If you need to find out the names of your rules, use
    # [DescribeInsightRules](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeInsightRules.html).
    @[JSON::Field(key: "RuleNames")]
    property rule_names : Array(String) = [] of String

    def initialize(
      @rule_names : Array(String),
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@rule_names)
  end
end
