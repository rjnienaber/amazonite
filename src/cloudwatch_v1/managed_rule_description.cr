module Amazonite::CloudWatchV1
  class ManagedRuleDescription
    include JSON::Serializable

    @[JSON::Field(key: "TemplateName")]
    property template_name : String | Nil

    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String | Nil

    @[JSON::Field(key: "RuleState")]
    property rule_state : ManagedRuleState | Nil

    def initialize(
      @template_name : String | Nil = nil,
      @resource_arn : String | Nil = nil,
      @rule_state : ManagedRuleState | Nil = nil,
    )
    end
  end
end
