private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class PutRuleResponse
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the rule.
    @[JSON::Field(key: "RuleArn")]
    property rule_arn : String | Nil

    def initialize(
      @rule_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @rule_arn
        raise Core::ValidationError.new("RuleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleArn length must be <= 1600") if value.size > 1600
      end
    end

    def_equals_and_hash(@rule_arn)
  end
end
