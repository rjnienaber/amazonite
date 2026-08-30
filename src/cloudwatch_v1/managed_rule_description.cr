private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @template_name
        raise Core::ValidationError.new("TemplateName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TemplateName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("TemplateName does not match the required pattern") unless value.matches?(Regex.new("^[0-9A-Za-z][\\-\\.\\_0-9A-Za-z]{0,126}[0-9A-Za-z]$"))
      end

      if value = @resource_arn
        raise Core::ValidationError.new("ResourceARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceARN length must be <= 1024") if value.size > 1024
      end

      if value = @rule_state
        value.validate!
      end
    end

    def_equals_and_hash(@template_name, @resource_arn, @rule_state)
  end
end
