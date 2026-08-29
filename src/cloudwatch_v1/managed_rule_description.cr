module Amazonite::CloudWatchV1
  # Contains information about managed Contributor Insights rules, as returned by
  # `ListManagedInsightRules`.
  class ManagedRuleDescription
    include JSON::Serializable

    # The template name for the managed rule. Used to enable managed rules using
    # `PutManagedInsightRules`.
    @[JSON::Field(key: "TemplateName")]
    property template_name : String | Nil

    # If a managed rule is enabled, this is the ARN for the related Amazon Web Services resource.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String | Nil

    # Describes the state of a managed rule. If present, it contains information about the Contributor
    # Insights rule that contains information about the related Amazon Web Services resource.
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
