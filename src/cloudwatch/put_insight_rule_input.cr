private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class PutInsightRuleInput
    include JSON::Serializable

    # A unique name for the rule.
    @[JSON::Field(key: "RuleName")]
    property rule_name : String

    # The state of the rule. Valid values are ENABLED and DISABLED.
    @[JSON::Field(key: "RuleState")]
    property rule_state : String | Nil

    # The definition of the rule, as a JSON object. For details on the valid syntax, see [Contributor
    # Insights Rule
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContributorInsights-RuleSyntax.html).
    @[JSON::Field(key: "RuleDefinition")]
    property rule_definition : String

    # A list of key-value pairs to associate with the Contributor Insights rule. You can associate as
    # many as 50 tags with a rule.
    #
    # Tags can help you organize and categorize your resources. You can also use them to scope user
    # permissions, by granting a user permission to access or change only the resources that have
    # certain tag values.
    #
    # To be able to associate tags with a rule, you must have the `cloudwatch:TagResource` permission
    # in addition to the `cloudwatch:PutInsightRule` permission.
    #
    # If you are using this operation to update an existing Contributor Insights rule, any tags you
    # specify in this parameter are ignored. To change the tags of an existing rule, use
    # [TagResource](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html).
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) | Nil

    # Specify `true` to have this rule evaluate log events after they have been transformed by [Log
    # transformation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch-Logs-Transformation.html).
    # If you specify `true`, then the log events in log groups that have transformers will be
    # evaluated by Contributor Insights after being transformed. Log groups that don't have
    # transformers will still have their original log events evaluated by Contributor Insights.
    #
    # The default is `false`
    #
    # If a log group has a transformer, and transformation fails for some log events, those log events
    # won't be evaluated by Contributor Insights. For information about investigating log
    # transformation failures, see [Transformation metrics and
    # errors](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Transformation-Errors-Metrics.html).
    @[JSON::Field(key: "ApplyOnTransformedLogs")]
    property apply_on_transformed_logs : Bool | Nil

    def initialize(
      @rule_name : String,
      @rule_definition : String,
      @rule_state : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @apply_on_transformed_logs : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @rule_name
        raise Core::ValidationError.new("RuleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("RuleName does not match the required pattern") unless value.matches?(Regex.new("^[\\x20-\\x7E]+$"))
      end

      if value = @rule_state
        raise Core::ValidationError.new("RuleState length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleState length must be <= 32") if value.size > 32
        raise Core::ValidationError.new("RuleState does not match the required pattern") unless value.matches?(Regex.new("^[\\x20-\\x7E]+$"))
      end

      if value = @rule_definition
        raise Core::ValidationError.new("RuleDefinition length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleDefinition length must be <= 8192") if value.size > 8192
        raise Core::ValidationError.new("RuleDefinition does not match the required pattern") unless value.matches?(Regex.new("^[\\x00-\\x7F]+$"))
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@rule_name, @rule_state, @rule_definition, @tags, @apply_on_transformed_logs)
  end
end
