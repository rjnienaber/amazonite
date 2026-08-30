module Amazonite::EventBridgeV1
  class PutRuleResponse
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the rule.
    @[JSON::Field(key: "RuleArn")]
    property rule_arn : String | Nil

    def initialize(
      @rule_arn : String | Nil = nil,
    )
    end
  end
end
